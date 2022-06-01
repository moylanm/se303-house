class House

  @@phrases = [
    "the house that Jack built",
    "the malt that lay in",
    "the rat that ate",
    "the cat that killed",
    "the dog that worried",
    "the cow with the crumpled horn that tossed",
    "the maiden all forlorn that milked",
    "the man all tattered and torn that kissed",
    "the priest all shaven and shorn that married",
    "the rooster that crowed in the morn that woke",
    "the farmer sowing his corn that kept",
    "the horse and the hound and the horn that belonged to",
  ]

  attr_reader :pirate, :phrases

  def initialize(pirate = false, random = false)
    @pirate = pirate
    @phrases = random ? randomize_phrases : @@phrases
  end
  
  def recite
    1.upto(12).map { |n| line(n) }.join("\n")
  end

  def line(number)
    "#{pirate ? "Thar be" : "This is"} #{line_helper(number)}.\n"
  end

  private

    def line_helper(number)
      if number == 1
        phrases[number - 1]
      else
        "#{phrases[number - 1]} #{line_helper(number - 1)}"
      end
    end

    def randomize_phrases
      
    end
end

