class Event < ApplicationRecord
  belongs_to :user # このユーザーはイベントの作成者を意味します。
  has_many :participants, dependent: :destroy # イベントは複数の参加者ユーザーと紐づいています。
  has_many :participants_users, through: :participants, source: :user #特定のイベントの参加者情報を取得

  enum rule: { normal: 0, catch: 1, hide: 2 } #ルール属性、初期値はnoraml
end
