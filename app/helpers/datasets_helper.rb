require 'builder'

module DatasetsHelper
  def records_to_html_table(records)
    records.each do |record|
    xm = Builder::XmlMarkup.new(:indent => 2)
    xm.table {
      xm.tr { record.data[0].keys.each { |key| xm.th(key)}}
      record.data.each { |row| xm.tr { row.values.each { |value| xm.td(value)}}}
    }
    xm.target.html_safe
      end
  end
end

