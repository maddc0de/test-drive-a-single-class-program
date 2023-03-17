class GrammarStats
  def initialize
  end

  def check(text_to_check) 
    fail "There is no text given to check, try again" if text_to_check == ""
    fail "Text must be a string, try again" unless text_to_check.is_a? String
    
    is_upcased = text_to_check == text_to_check.capitalize
    is_punctuated = ["!", "?", "."].include? text_to_check[-1]
    
    if is_upcased && is_punctuated
      true
    else
      false
    end

    # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end

# text_to_check = GrammarStats.new
# text_to_check.check("hello world")