class GrammarStats
  def initialize
    @total_number_of_text = 0
    @passed_text = 0
  end

  def check(text_to_check)
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    fail "There is no text given to check, try again" if text_to_check == ""
    fail "Text must be a string, try again" unless text_to_check.is_a? String
    
    @total_number_of_text += 1

    is_upcased = text_to_check == text_to_check.capitalize
    is_punctuated = ["!", "?", "."].include? text_to_check[-1]
    
    if is_upcased && is_punctuated
      @passed_text += 1
      true
    else
      false
    end
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 66 represents 66%.

    percent = (@passed_text.to_f / @total_number_of_text.to_f) * 100
    percent.to_i
  

  end
end