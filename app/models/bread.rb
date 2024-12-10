class Bread
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :a, :integer, default: 2
  attribute :b, :integer, default: 3
  validates :a, :b, presence: true

  def sum
    a + b
  end

  def product
    a * b
  end

  def exponent
    a ** b
  end
end
