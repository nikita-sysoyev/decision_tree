class Action < ApplicationRecord
  validate :correct_properties
  
  private

  def correct_properties
    unless properties && (1..10).include?(properties.keys.count)
      errors.add(:properties, 'Wrong amount of properties')
    end

    if properties.values.any? { |v| !v.is_a? String }
      errors.add(:properties, 'Wrong type of properties')
    end
  end
end
