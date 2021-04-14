class Subscription < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :reader

  def print_details
    reader = Reader.find(self.reader_id)
    magazine = Magazine.find(self.magazine_id)
    puts "#{reader.name} subscribed to #{magazine.title} for $#{self.price}"
  end

end