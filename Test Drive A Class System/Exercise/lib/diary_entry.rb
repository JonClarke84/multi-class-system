class DiaryEntry
  def initialize(title, contents) # title, contents are strings

    fail "title and contents are blank" if title == "" && contents == ""
    fail "title is blank" if title == ""
    fail "contents are blank" if contents == ""
  
    @title = title
    @contents = contents
    @remaining_contents = @contents
  end

  def title
    @title
  end

  def contents
   @contents
  end

  def count_words
    @contents.split.count
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    count_words / wpm
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.

    @remaining_contents = @contents if @remaining_contents == ""

    reading_chunk = []
    total_words = wpm * minutes
    remaining_contents = @remaining_contents.split(/ /)

    reading_chunk = remaining_contents.slice!(0...total_words).join(" ")
    @remaining_contents = remaining_contents.join(" ")
    reading_chunk
  end
end