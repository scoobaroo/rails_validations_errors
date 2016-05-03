class Owner < ActiveRecord::Base
  has_many :pets
  # TODO: add validations
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true


  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    p phone
    phone.gsub!(/[\(]|[,]|[\)]|[.]|[-]/,"")
    phone.gsub!(/\A/,"")
    if phone[0].to_i == 1
      # phone = phone.delete phone[0]
      phone.gsub!(/\A/,"")
      phone
    end
    phone
  end
end
