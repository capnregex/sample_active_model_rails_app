class Bread
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :a, :integer, default: 2
  attribute :b, :integer, default: 3
  validates :a, :b, presence: true
  attr_writer :a2, :b2, :c2

  def sum
    a + b
  end

  def product
    a * b
  end

  def exponent
    a ** b
  end

  # memoization pattern
  # if @a2 
  #   @a2
  # else
  #   @a2 = a * a
  #
  def a2
    @a2 ||= a * a
  end

  def b2
    @b2 ||= b * b
  end

  def c2
    @c2 ||= a2 + b2
  end

  def c
    @c ||= Math.sqrt(c2)
  end

  def call
    return unless valid? 

    c
  end

  # class methods
  class << self
    def call(**)
      new(**).call
    end

    def proc
      ->(options) { new(**options).call }
    end
  end
end
