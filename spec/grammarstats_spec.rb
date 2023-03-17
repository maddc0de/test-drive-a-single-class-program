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




end





# obj = text
# methods = check, percentage_good

# check method returns true if text begins with uppercase && ends with [.!?]