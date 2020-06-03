class Card < ApplicationRecord
  belongs_to :tasklist

  validates :card_name, length:{in: 1..255}
  validates :content, length:{maximum:1000}
end
