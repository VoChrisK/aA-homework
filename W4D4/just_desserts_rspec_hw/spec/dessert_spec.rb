require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("pie", 15, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.instance_variable_get(:@type)).to eq("pie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(15)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.instance_variable_get(:@ingredients)).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "12", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("rhubarb")
    end

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to include("rhubarb")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      some_ingredients = ["milk", "flour", "eggs", "sugar"]
      some_ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end
      dessert.mix!
      expect(dessert.ingredients).to_not eq(some_ingredients)
      expect(dessert.ingredients.sort).to eq(some_ingredients.sort)
    end

    it "uses the built-in method Array#shuffle!" do
      expect(dessert.instance_variable_get(:@ingredients)).to receive(:shuffle!)
      dessert.mix!
    end
  end

  describe "#eat" do 
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(10)
      dessert.eat(10)
      expect(dessert.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(16) }.to raise_error(StandardError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Curry")
      expect(dessert.serve).to eq("Chef Curry has made 15 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(dessert)
      expect(dessert.instance_variable_get(:@chef)).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
