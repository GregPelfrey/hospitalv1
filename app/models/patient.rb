class Patient < ActiveRecord::Base
belongs_to :hospital

  validates :first_name,  presence:   true
  validates :last_name,  presence:   true
  validates :description,  presence:   true
  validates :blood_type,  presence:   true
  validate :at_least_10

    def at_least_10
      if self.date_of_birth
        errors.add(:date_of_birth, ' , Must be at least 10 years old!') if self.date_of_birth > 10.years.ago.to_date
      end
    end


  BLOOD_TYPE = [
    "O",
    "O+",
    "A",
    "A-",
    "B",
    "B-",
    "AB"
  ]


end
