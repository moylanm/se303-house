class House

  @@phrases = {
    prefix: [
      "",
      "",
    ],
    subjects: [
      "malt that ",
      "rat that ",
      "cat that ",
      "dog that ",
      "cow with the crumpled horn that ",
      "maiden all forlorn that ",
      "man all tattered and torn that ",
      "priest all shaven and shorn that ",
      "rooster that crowed in the morn that ",
      "farmer sowing his corn that ",
      "horse and the hound and the horn that ",
    ],
    verbs: [
      "lay in the ",
      "ate the ",
      "killed the ",
      "worried the ",
      "tossed the ",
      "milked the ",
      "kissed the ",
      "married the ",
      "woke the ",
      "kept the ",
      "belonged to the ",
    ]
  }

  attr_reader :pirate, :phrases

  def initialize(pirate = false, random = false)
    @pirate = pirate
    @phrases = random ? randomized_phrases : original_phrases
  end
  
  def recite
    1.upto(12).map { |n| line(n) }.join("\n")
  end

  def line(number)
    "#{pirate ? "Thar be" : "This is"} the #{line_helper(number)}house that Jack built.\n"
  end

  private

    def line_helper(number)
      number.downto(1).collect { |i| phrases[i] }.join("")
    end

    def original_phrases
      integrate_arrays(@@phrases[:subjects], @@phrases[:verbs])
    end

    def randomized_phrases
      integrate_arrays(@@phrases[:subjects].shuffle, @@phrases[:verbs].shuffle)
    end

    def integrate_arrays(subjects, verbs)
      subjects
      .zip(verbs)
      .map { |phrase| phrase.join }
      .insert(0, @@phrases[:prefix])
      .flatten
    end
end

