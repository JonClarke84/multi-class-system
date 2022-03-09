require 'diary_entry'

class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry) 
    @diary_entries << entry
  end

  def all
    @diary_entries.map { |entry| [entry.title, entry.contents] }
  end

  def count_words
    count = 0
    all.each do |entry|
      entry.each do |ele|
        count += ele.split.count
      end
    end
    count
    
  end

  def reading_time(wpm)
    (count_words.to_f / wpm).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    total_words_to_read = wpm * minutes
    entries_array = []

    @diary_entries.each do |entry|
      if entry.count_words <= total_words_to_read
        entries_array << entry
      end
    end
    entries_array.sort_by! { |entry| entry.count_words}
    entries_array[-1]
  end
end