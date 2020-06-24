class Session < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groupings
  has_many :groups, through: :groupings
  validates :amount, presence: true, numericality: { only_float: true }
  validates :name, presence: true

  def group
    groups.first
  end

  def group=(group)
    g = Group.find_by(name: group)
    groups << g if g
  end
end
