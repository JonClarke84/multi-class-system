require 'diary_entry'

class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
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

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.

    (count_words.to_f / wpm).ceil

  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    total_words_to_read = wpm * minutes
    entries_array = @diary_entries

    entries_array.each_with_index do |entry, index|
      if entry.count_words > total_words_to_read
        entries_array.delete[index]
      end
    end


    current_selection = @diary_entries[1]

    @diary_entries.each { |entry| if remainder of => entry.reading_time < current_selection then current_selection = entry}

  end
end