class Event < ApplicationRecord
  belongs_to :user
  has_many :performances
  has_many :performers

  mount_uploader :event_attachment, EventUploader

  validates :event_name, length: { in: 3..255 }
  validates_presence_of :event_name, :event_description
  
  accepts_nested_attributes_for :performers, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

end
