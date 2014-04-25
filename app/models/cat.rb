# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  age        :integer
#  birth_date :date
#  color      :string(255)      not null
#  name       :string(255)
#  sex        :string(1)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          default(-1), not null
#

class Cat < ActiveRecord::Base
  validates :age, numericality: true
  validates :name, :age, :birth_date, :sex, presence: true
  validate :safe_sex

  has_many :rental_requests,
  class_name: 'CatRentalRequest',
  foreign_key: :cat_id,
  primary_key: :id,
  dependent: :destroy

  belongs_to :user

  def safe_sex
    errors[:base] << 'Wrong sex.' unless self.sex.upcase == 'M' or self.sex.upcase == 'F'
  end
end
