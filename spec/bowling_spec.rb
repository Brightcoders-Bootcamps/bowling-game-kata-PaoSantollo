require '..\bowling.rb'

describe Tiro do
  describe "valid?" do
    it "cuando se intenten tirar un numero fuera del rango" do
      expect(Tiro.valid? 11).not_to be valid
    end
    it "cuando se intenten tirar un numero dentro del rango" do
      expect(Tiro.valid? 9).to be_valid
    end
  end
end
