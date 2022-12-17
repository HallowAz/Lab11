class Result < ApplicationRecord
   validates :number, presence: true

   validates :number, numericality: {only_integer: true, greater_than_or_equal_to: 0 }

   validates :number, uniqueness: true

end
