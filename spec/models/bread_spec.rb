require 'rails_helper'

RSpec.describe Bread do
  let(:bread_options) { |example| example.metadata.slice(:a, :b) }
  let(:bread) { Bread.new(**bread_options) }

  it "default 2:3" do 
    expect(bread.sum).to eq(5)
    expect(bread.product).to eq(6)
    expect(bread.exponent).to eq(8)
  end

  it "3:2", a: 3, b: 2 do
    expect(bread.sum).to eq(5)
    expect(bread.product).to eq(6)
    expect(bread.exponent).to eq(9)
  end

  it "3:4", a: 3, b: 4 do 
    expect(bread.a2).to eq(9)
    expect(bread.c).to eq(5.0)
  end

  it "3:4 call", a: 3, b: 4 do
    expect(bread.call).to eq(5.0)
  end

  it "blank call", a: '', b: '' do
    expect(bread.call).to be_nil
  end

  it "class.call" do
    foo = [
      { a: 3, b: 4 },
      { a: 5, b: 12 },
    ]
    bar = foo.map(&Bread.proc)
    expect(bar).to eq([5,13])
  end
end
