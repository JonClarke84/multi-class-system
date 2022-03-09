require 'diary'
require 'diary_entry'
require 'range_as_string'

RSpec.describe Diary do
  context "given an instance of DiaryEntry" do
    it "stores it to an array and can return it" do
      diary = Diary.new
      entry1 = DiaryEntry.new("1", "My life is great.")
      entry2 = DiaryEntry.new("2", "My life is now crap.")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.all).to eq [["1", "My life is great."],["2", "My life is now crap."]]
    end
  end

  context "given several entries" do
    it "counts all words across all entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("1", "My life is great.")
      entry2 = DiaryEntry.new("2", "My life is now crap.")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.count_words).to eq 11
    end
  end

  context "given several entries and a reading speed" do
    it "returns how long to read all words across all entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("1", "My life is great mate.")
      entry2 = DiaryEntry.new("2", "My life is now crap.")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(2)).to eq 6
    end
  end

  context "given several entries and a reading speed" do
    it "returns how long to read all words across all entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("1", "My life is great mate.")
      entry2 = DiaryEntry.new("2", "My life is now crap dude.")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(2)).to eq 7
    end
  end

  context "given a reading speed and time available" do
    it "returns a suitable diary entry for reading" do
      diary = Diary.new
      entry1 = DiaryEntry.new("1", "My life is great mate.")
      entry2 = DiaryEntry.new("2", "My life is now crap because I have lost all my money and my friends abandonded me, isn't this terrible.")
      entry3 = DiaryEntry.new("3", "My life is now crap because I have lost all my money and my friends abandonded me, isn't this terrible. My life is now crap because I have lost all my money and my friends abandonded me, isn't this terrible.")
      diary.add(entry1)
      diary.add(entry2)
      diary.add(entry3)
      expect(diary.find_best_entry_for_reading_time(20, 1)).to eq entry2
    end
  end

  context "given a reading speed and time available" do
    it "returns a suitable diary entry for reading" do
      diary = Diary.new
      entry1 = DiaryEntry.new("1", "My life is now crap because I have lost all my money and my friends abandonded me, isn't this terrible. My life is now crap because I have lost all my money and my friends abandonded me, isn't this terrible.")
      entry2 = DiaryEntry.new("2", "My life is great mate.")
      entry3 = DiaryEntry.new("3", "My life is now crap because I have lost all my money and my friends abandonded me, isn't this terrible.")
      entry4 = DiaryEntry.new("4", "My life is super great mate.")
      diary.add(entry1)
      diary.add(entry2)
      diary.add(entry3)
      diary.add(entry4)
      expect(diary.find_best_entry_for_reading_time(20, 1)).to eq entry3
    end
  end
end