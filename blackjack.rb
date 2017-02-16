class Card
    attr_accessor :full_deck, :player_hand, :computer_hand, :suit, :rank

    def initialize
        @suit = []
        @rank = []
        @full_deck = []
        @player_hand = []
        @computer_hand = []
    end

    def create_cards
        # Create the four suits
        @suit = ["Hearts", "Diamonds", "Spades", "Clubs"]
        # Create the values needed for each family from 1 -> Ace
        @rank = ("2".."10").to_a + ["Jack", "Queen", "King", "Ace"]
        # For each of the four suits...
        suit.each do |suit|
            # ... write the card values out sequentially.
            rank.each do |rank|
                @full_deck.push("The #{rank} of #{suit}")
            end
        end
        return @full_deck
    end

    def start_game
        puts "Do you want to play? (y/n)"
        answer = gets.chomp.downcase
        if answer == "y"
            self.create_cards
            self.shuffle
            self.deal
            self.hit_or_stick
        elsif answer == "n"
            puts "No problem! See you soon!"
            die
        else answer != "y" || "n"
            puts "Please answer 'y' or 'n'."
            self.start_game
        end
    end

        # Prints out a separator to format output in a more readable way
    def separator
        puts "-" * 100
    end

    # def give_cards_values
        
            
    #     cards_with_scores=Hash[scores.zip(@full_deck)]
    #     puts cards_with_scores;
    # end

    # Troubleshooting method to print card values during different game states
    def print_cards
        return @computer_hand.inspect
    end

    # Shuffle the cards
    def shuffle
        return @full_deck.shuffle!
    end
    
    # Deal the cards
    def deal
        self.separator
        player = @full_deck.slice!(0, 2)
        @player_hand.push(player)
        puts "The player has been dealt the following hand: "
        puts @player_hand
        self.separator

        self.separator
        computer = @full_deck.slice!(0, 2)
        @computer_hand.push(computer)
        puts "The computer has been dealt the following hand: "
        puts @computer_hand
        self.separator

        # self.give_cards_values
    end

    def hit_or_stick
        puts "Would you like to hit (h) or stick (s)?"
        answer = gets.chomp.downcase
        if answer == "h"
            player = @full_deck.slice!(0, 1)
            @player_hand.push(player)
            self.separator
            puts "The player now has the following hand: "
            puts @player_hand
            self.separator
            self.hit_or_stick
        elsif answer == "s"
            self.separator
            puts "Your final hand is: "
            puts @player_hand
            self.separator
        else
            answer != "h" || "s"
            puts "Don't make me angry. You wouldn't like me when I'm angry. Please choose to either hit (h) or stick (s)."
            self.hit_or_stick
        end
    end
end

game = Card.new
game.start_game