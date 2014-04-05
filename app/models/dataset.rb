require 'csv'

class Dataset < ActiveRecord::Base
  belongs_to :user
  has_many :records, :dependent => :destroy
  has_attached_file :file
  validates_attachment :file, presence: true,
                       :content_type => { content_type: 'text/csv' }

  before_save :parse_file

  def parse_file
    tempfile = file.queued_for_write[:original].read
    my_csv = CSV.new(tempfile, :headers => true,
                               :header_converters => :symbol,
                               :converters => :all)
    byebug
    my_array_of_hashes = my_csv.to_a.map {|row| row.to_hash}
    # byebug
    my_array_of_hashes.each do |hash|
      # record = Record.new(dataset: self) # This is another way to do it.
      record = self.records.build
      record.data = hash
      record.save
    end
  end

end
