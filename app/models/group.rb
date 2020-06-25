class Group < ApplicationRecord
  # rubocop:disable Layout/LineLength
  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z\s]+\z/, message: 'Only letters are allowed' }, length: { in: 3..30 }
  validates :icon, format: { with: /.+\.(jpe?g|png)\z/, message: 'only Allows JPEG,JPG and PNG pictures are allowed.' }, allow_blank: true

  has_many :groupings
  has_many :sessions, through: :groupings

  def to_param
    name
  end
end

# rubocop:enable Layout/LineLength
