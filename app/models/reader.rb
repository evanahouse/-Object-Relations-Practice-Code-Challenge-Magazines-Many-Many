class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(price: price, reader_id: self.id, magazine_id: magazine.id)
    end

    def total_subscription_price
        allMags = Subscription.where(reader_id: self.id)
        prices = allMags.map{|mag|mag.price}
        prices.sum
    end

    def cancel_subscription(magazine)
        self.subscriptions.find_by(magazine_id: magazine.id).destroy
    end
end