class Linetracker < ActiveRecord::Base
belongs_to :user
validates :name, presence: true
validates :country, presence: true
validates :currency, presence: true
validates :amount, presence: true
validates :date, presence: true
validates :time, presence: true
end