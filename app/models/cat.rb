class Cat < ActiveRecord::Base
  validates :age, numericality: true
  validates :name, :age, :birth_date, :sex, presence: true
  validate :safe_sex

  has_many :rental_requests,
  class_name: 'CatRentalRequest',
  foreign_key: :cat_id,
  primary_key: :id,
  dependent: :destroy

  def safe_sex
    errors[:base] << 'Wrong sex.' unless self.sex.upcase == 'M' or self.sex.upcase == 'F'
  end
end
