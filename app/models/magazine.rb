class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    self.readers.map{|r| r.email}.join(';')
  end

  def self.most_popular
    max = self.all.sort_by{|mag| mag.subscriptions.size}.last
    self.all.filter {|mag| mag.subscriptions.size == max.subscriptions.size}
  end
end