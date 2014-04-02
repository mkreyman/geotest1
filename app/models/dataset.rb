class Dataset < ActiveRecord::Base
  belongs_to :user
  has_many :records, :dependent => :destroy
  has_attached_file :file
end
