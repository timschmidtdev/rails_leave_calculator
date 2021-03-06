module RandomData
  def self.random_name
    first_name = random_word.capitalize
    last_name = random_word.capitalize
    "#{first_name} #{last_name}"
  end

  def self.random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end
  
  def self.random_sentence
    strings = []
    rand(1..3).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(6..10)].join
  end

  def self.random_date
    rand(Date.today..Date.today+(180))
  end

  def self.random_decimal
    rand(58..184)
  end
end
