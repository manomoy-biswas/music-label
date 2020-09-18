class Performance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  mount_uploader :attachment, PerformanceUploader
  
  validates :title, length: { in : 3..255 }
  valodates validates_presence_of :title, :description, :attachment
end
