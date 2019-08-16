class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates :name, uniqueness: true, presence: true
  def before_destroy
    return true if cocktails.count.zero?

    errors.add :base, 'Cannot delete booking with payments'
    throw(:abort)
  end
end
