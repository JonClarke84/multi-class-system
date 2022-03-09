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
end