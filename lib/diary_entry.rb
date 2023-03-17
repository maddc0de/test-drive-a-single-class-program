class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents.split(" ") # array
    @counter = 0
  end

  def title
    return @title
  end

  def contents
    return @contents.join(" ")  # string
  end

  def count_words
    return @contents.length
  end

  def reading_time(wpm)
    return @contents.length / wpm
  end

  def reading_chunk(wpm, minutes)
    string_to_return = @contents[@counter...@counter+(wpm * minutes)].join(" ")
    if @counter + (wpm * minutes) >= @contents.length
      @counter = 0
    else
      @counter += (wpm * minutes)
    end
    string_to_return
  end

end


