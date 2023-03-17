require 'exercise'

RSpec.describe DiaryEntry do
  it "returns title as a string" do
    diary_entry = DiaryEntry.new("day 1", "hello diary")
    expect(diary_entry.title).to eq "day 1"
  end

  it "returns contents as a string" do
    diary_entry = DiaryEntry.new("day 1", "hello diary")
    expect(diary_entry.contents).to eq "hello diary"
  end

  it "returns number of words in the contents as an integer" do
    diary_entry = DiaryEntry.new("day 1", "hello diary")
    expect(diary_entry.count_words).to eq 2
  end

  it "returns reading time in minutes as an integer" do
    text = "hello " * 60
    diary_entry = DiaryEntry.new("day 1", text)
    expect(diary_entry.reading_time(60)).to eq 1
  end

  it "returns 60 words when reading time is 1 minute" do
    text = "hello" * 60
    diary_entry = DiaryEntry.new("day 1", text)
    expect(diary_entry.reading_chunk(60, 1)).to eq text
  end

  it "returns the next 60 words when reading_chunk is called the 2nd time" do
    text = ("hello " * 60) + ("world " * 60)
    expected_result = "world " * 60
    diary_entry = DiaryEntry.new("day 1", text)
    result_1 = diary_entry.reading_chunk(60, 1)
    result_2 = diary_entry.reading_chunk(60, 1)
    expect(result_2).to eq expected_result.rstrip
  end

  it "returns the first 60 words when reading_chunk is called the 3rd time" do
    text = ("hello " * 60) + ("world " * 60)
    expected_result = "hello " * 60
    diary_entry = DiaryEntry.new("day 1", text)
    result_1 = diary_entry.reading_chunk(60, 1)
    result_2 = diary_entry.reading_chunk(60, 1)
    result_3 = diary_entry.reading_chunk(60, 1)
    expect(result_3).to eq expected_result.rstrip
  end

  it "returns the first 10 words when reading_chunk is called the 3rd time" do
    text = ("hello " * 60) + ("world " * 70)
    expected_result = "world " * 10
    diary_entry = DiaryEntry.new("day 1", text)
    result_1 = diary_entry.reading_chunk(60, 1)
    result_2 = diary_entry.reading_chunk(60, 1)
    result_3 = diary_entry.reading_chunk(60, 1)
    expect(result_3).to eq expected_result.rstrip
  end

  it "returns the first 60 hellos when reading_chunk is called the 4th time" do
    text = ("hello " * 60) + ("world " * 70)
    expected_result = "hello " * 60
    diary_entry = DiaryEntry.new("day 1", text)
    result_1 = diary_entry.reading_chunk(60, 1)
    result_2 = diary_entry.reading_chunk(60, 1)
    result_3 = diary_entry.reading_chunk(60, 1)
    result_4 = diary_entry.reading_chunk(60, 1)
    expect(result_4).to eq expected_result.rstrip
  end
end