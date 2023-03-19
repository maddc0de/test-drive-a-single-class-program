require_relative '../lib/grammarstats'

RSpec.describe GrammarStats do
  context "fails" do
    it "fails when text given is empty" do
      text = GrammarStats.new
      expect { text.check("") }.to raise_error "There is no text given to check, try again" 
    end

    it "fails when text given is not a string" do
      text = GrammarStats.new
      expect { text.check(1) }.to raise_error "Text must be a string, try again" 
    end

  end

  context "returns true" do
    it "return true when text begins with an uppercase letter and ends with a period" do
      text = GrammarStats.new
      expect(text.check("I am a developer.")).to eq true
    end

  end

  context "returns false" do
    it "return false when text begins with a lowercase letter and ends with a period" do
      text = GrammarStats.new
      expect(text.check("i am a developer.")).to eq false
    end

    it "return false when text begins with an uppercase letter and doesn't end with a punctuation mark" do
      text = GrammarStats.new
      expect(text.check("i am a developer.")).to eq false
    end

  end

  context "percetage_good" do
    it "returns 50 when given text to check twice but only 1 passed the check" do
      text = GrammarStats.new
      text.check("i am not a developer.")
      text.check("I am a developer.")
      expect(text.percentage_good).to eq 50
    end

    it "returns 66 when given 3 text to check but only 2 passed the check" do
      text = GrammarStats.new
      text.check("i am not a developer.")
      text.check("I am a developer.")
      text.check("You are a developer.")
      expect(text.percentage_good).to eq 66
    end

  end

end