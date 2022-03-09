require 'diary'
require 'range_as_string'

RSpec.describe Diary do
  context "given an instance of DiaryEntry" do
    it "stores it to an array and can return it" do
      diary = Diary.new
      diary.add("Diary entry")
      diary.add("Diary entry two")
      expect(diary.all).to eq ["Diary entry", "Diary entry two"]
    end
  end
end