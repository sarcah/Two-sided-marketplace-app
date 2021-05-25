class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    
    # validates :author, presence: true

    has_many :articles

    has_many :sales, class_name: "Transaction", foreign_key: :seller_id
    has_many :sold_articles, through: :sales, source: :article

    has_many :purchases, class_name: "Transaction", foreign_key: :buyer_id
    has_many :purchased_articles, through: :purchases, source: :article

    scope :sellers, -> { joins(:sales) }
    scope :buyers, -> { joins(:purchases) }

end
