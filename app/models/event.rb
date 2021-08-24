class Event < ApplicationRecord
  belongs_to :user # このユーザーはイベントの作成者を意味します。
  has_many :participants, dependent: :destroy # イベントは複数の参加者ユーザーと紐づいています。
  # has_many :participants_users, through: :participants, source: :user #特定のイベントの参加者情報を取得

  validates :message, presence: true,length: { maximum: 140 } #メッセージは最大140字まで
  validates :start_datetime, presence: true
  validates :finish_datetime, presence: true
  validates :rule, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2} #予期せぬenum属性が入らないように、念の為整数値かつ0~2で制限
  validates :max_crews, presence: true, numericality: {only_integer: true, less_than_or_equal_to: 15} # クルーの最大人数は15人まで
  
  enum rule: { normal: 0, catch: 1, hide: 2 } #ルール属性、初期値はnoraml

  scope :feature_event, -> { where("start_datetime > ?", Time.now()) }
end
