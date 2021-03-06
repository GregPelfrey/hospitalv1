class Hospital < ActiveRecord::Base
  validates :name,     presence: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :city,     presence: true
  validates :state,    presence: true
  validates :zip,      presence: true
  validates :phone,    presence: true


  has_many  :patients, dependent:  :destroy

end
