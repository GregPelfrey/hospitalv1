class Med < ActiveRecord::Base
belongs_to :patient

  validates :med_name, presence: true
  validates :med_class, presence: true
  validates :med_dosage, presence: true
  validates :med_use, presence: true

end