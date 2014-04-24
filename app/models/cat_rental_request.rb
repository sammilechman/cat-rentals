require 'debugger'

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates_inclusion_of :status, in: ['PENDING', 'APPROVED', 'DENIED']
  validate :overlapping_approved_requests

  belongs_to :cat

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED"
      self.save!

      overlapping_pending_requests.each do |request|
        request.deny!
      end
    end
  end

  def pending?
    self.status == 'PENDING'
  end

  def deny!
    self.status = 'DENIED'
    self.save!
  end

  def overlapping_requests
    options = {start_date: self.start_date, end_date: self.end_date}
    CatRentalRequest.find_by_sql([<<-SQL, options])
    SELECT cat_rental_requests.*
    FROM cat_rental_requests
    WHERE cat_rental_requests.start_date BETWEEN:start_date AND :end_date OR
    cat_rental_requests.end_date BETWEEN:start_date AND :end_date
    SQL
  end

  def overlapping_pending_requests
    overlapping_requests.select do |request|
      request.status == 'PENDING'
    end
  end

  def overlapping_approved_requests
    overlapping_requests.each do |request|
      if request.status == 'APPROVED'
        errors[:base] << "Busy cat."
      end
    end
    # debugger

  end
end
