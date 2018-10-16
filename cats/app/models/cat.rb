# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sex         :string(1)        not null
#
require 'action_view'

COLORS = %w(red orange yellow green blue purple black white grey)

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F U),
    message: "%{value} is not valid" }
  validates :birth_date, presence: true
  validates :name, presence: true
  validates :description, presence: true

  def age
    today = format_date(Date.today)
    birthday = format_date(self.birth_date)
    if today[1] < birthday[1]
      today[0] - birthday[0] - 1
    else
      today[0] - birthday[0]
    end
  end

  def format_date(date)
    date_str = date.to_s.split("-")
    yr_monthdate = [date_str[0], (date_str[1] + date_str[2])]
    yr_monthdate.map(&:to_i)
  end
end
