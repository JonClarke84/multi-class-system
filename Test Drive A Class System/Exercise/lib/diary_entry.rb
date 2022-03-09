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

  def reading_time(wpm) 
    count_words / wpm
  end

  def reading_chunk(wpm, minutes) 
    @remaining_contents = @contents if @remaining_contents == ""

    reading_chunk = []
    total_words = wpm * minutes
    remaining_contents = @remaining_contents.split(/ /)

    reading_chunk = remaining_contents.slice!(0...total_words).join(" ")
    @remaining_contents = remaining_contents.join(" ")
    reading_chunk
  end
end