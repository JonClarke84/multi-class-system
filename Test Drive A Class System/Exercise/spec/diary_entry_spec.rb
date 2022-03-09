require 'diary_entry'
require 'range_as_string'

RSpec.describe DiaryEntry do

  context "given an empty string" do
    it "raises an error" do
      expect { entry = DiaryEntry.new("", "") }.to raise_error "title and contents are blank"
    end

    it "raises an error" do
      expect { entry = DiaryEntry.new("", "this has a blank title") }.to raise_error "title is blank"
    end

    it "raises an error" do
      expect { entry = DiaryEntry.new("this has blank contents", "") }.to raise_error "contents are blank"
    end
  end
  
  it "returns the title" do
    entry = DiaryEntry.new("My Diary", "Today I had a great day")
    expect(entry.title).to eq "My Diary"
  end

  it "returns the contents" do
    entry = DiaryEntry.new("My Diary", "Today I had a great day")
    expect(entry.contents).to eq "Today I had a great day"
  end

  it "counts the words" do
    entry = DiaryEntry.new("My Diary", "Today I had a great day")
    expect(entry.count_words).to eq 6
  end

  it "returns the correct reading time" do
    entry = DiaryEntry.new("My Diary", range_as_string(1, 100))
    expect(entry.reading_time(50)).to eq 2
  end

  it "returns a string with a chunk the reader could read in the time given" do
    entry = DiaryEntry.new("My Diary", range_as_string(1, 100))
    expect(entry.reading_chunk(50, 1)).to eq range_as_string(1, 50)
  end

  it "reading_chunk called a second time returns the second half" do
    entry = DiaryEntry.new("My Diary", range_as_string(1, 100))
    entry.reading_chunk(50, 1)
    expect(entry.reading_chunk(50, 1)).to eq range_as_string(51, 100)
  end

  it "reading_chunk called a third time returns the first half" do
    entry = DiaryEntry.new("My Diary", range_as_string(1, 100))
    entry.reading_chunk(50, 1)
    entry.reading_chunk(50, 1)
    expect(entry.reading_chunk(50, 1)).to eq range_as_string(1, 50)
  end

  end