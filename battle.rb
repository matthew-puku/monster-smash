class Battle
    attr_accessor :combatants
    def initialize
        @combatants = combatants
    end

    # check HP for user and computer
    # if HP!= 0 continue play
    # if HP = 0 lead to victory/defeat screen
    def HPcheck(current_HP)
    end

    # print victory/defeat screen messages
    # if user HP!=0 && computer HP = 0 --> VICTORY
    # if user HP=0 && computer HP !=0 --> DEFEAT
    def printScreen(status)
    end

    # print the user's four move options  
    def displayChoices
    end

    # print menu of user moves
    def displayMove
    end
end