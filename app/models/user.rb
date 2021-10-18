class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. ilude both letters and numbers'

  with_options presence: true, format: { with: /[^\x01-\x7Eｦ-ﾟ]+/, message: 'is input full-width characters' } do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: 'is invalid.input full-width katakana characters' } do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
  validates :nickname, presence: true
  validates :birthday, presence: true

  has_many :items
  has_many :cards
end
