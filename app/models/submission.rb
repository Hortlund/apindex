class Submission < ApplicationRecord
    before_save :calculate_difference
  
    validates :name, presence: true, length: { maximum: 40 }
    validates :height, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 400 }
    validates :arm_length, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 400 }
    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }
    validates :gender, presence: true, inclusion: { in: ['Man', 'Kvina', 'Annat'] }
  
    private
  
    def calculate_difference
      self.difference = arm_length - height
    end
  end