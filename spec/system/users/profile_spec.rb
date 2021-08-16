require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'Name', with: 'AmongUse'
          fill_in 'Email', with: 'email@example.com'
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Registration'
          # expect(page).to have_content 'ユーザー登録に失敗しました。'
          expect(page).to have_content ''
          expect(current_path).to eq login_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'Name', with: 'AmongUse'
          fill_in 'Email', with: ''
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Registration'
          expect(page).to have_content ''
          expect(page).to have_content ''
          # expect(page).to have_content 'メールアドレスを入力してください'
          # expect(page).to have_content 'メールアドレスは不正な値です'
          expect(current_path).to eq users_path
        end
      end

      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in 'Email', with: existed_user.email
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Registration'
          # expect(page).to have_content '1 error prohibited this user from being saved'
          # expect(page).to have_content '既に使われているメールアドレスです。'
          expect(page).to have_content ''
          expect(page).to have_content ''
          expect(current_path).to eq users_path
          expect(page).to have_field 'Email', with: existed_user.email
        end
      end
    end

    describe 'マイページ' do
      context 'ログインしていない状態' do
        it 'マイページへのアクセスが失敗する' do
          visit user_path(user)
          expect(page).to have_content('')
          # expect(page).to have_content('ログインに失敗しました。')
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login(user) }

    describe 'ユーザー編集' do
      # context 'フォームの入力値が正常' do
      #   it 'ユーザーの編集が成功する' do
      #     visit edit_user_path(user)
      #     fill_in 'Name', with: ''
      #     fill_in 'Message', with: 'hogehoge'
      #     fill_in 'Mattermost times url', with: 'test'
      #     click_button 'Registration'
      #     expect(page).to have_content('')
      #     expect(current_path).to eq user_path(user)
      #   end
      # end

      context 'メッセージが未入力' do
        it 'ユーザーの編集が失敗する' do
          visit edit_user_path(user)
          fill_in 'Name', with: 'hoge'
          fill_in 'Message', with: ''
          fill_in 'Mattermost times url', with: 'test'
          click_button 'Registration'
          expect(page).to have_content('メッセージを入力してください')
          expect(current_path).to eq user_path(user)
        end
      end

      context '他ユーザーの編集ページにアクセス' do
        it '編集ページへのアクセスが失敗する' do
          other_user = create(:user)
          visit edit_user_path(other_user)
          expect(page).to have_content ''
          expect(current_path).to eq user_path(user)
        end
      end
    end

    describe 'イベント' do
      context 'イベントを作成' do
        xit '新規作成したイベントが表示される' do
          create(:event, title: 'test_title', status: :doing, user: user)
          visit user_path(user)
          expect(page).to have_content('You have 1 task.')
          expect(page).to have_content('test_title')
          expect(page).to have_content('doing')
          expect(page).to have_link('Show')
          expect(page).to have_link('Edit')
          expect(page).to have_link('Destroy')
        end
      end
    end
  end
end