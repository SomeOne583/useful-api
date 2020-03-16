class TuringMachine
    def initialize
        @tape = [0]
        @position = 0
        @ouputs = []
    end

    def execute(instrucciones)
        index = 0
        substring = []
        control = 0
        stdin = ""
        reading = false
        while index < instrucciones.length
            c = instrucciones[index]
            case c
            when '+'
                reading = false
                @tape[@position] += 1
            when '-'
                reading = false
                @tape[@position] -= 1
            when '>'
                reading = false
                @tape << 0 if @position == @tape.size - 1
                @position += 1
            when '<'
                reading = false
                @position -= 1
            when '.'
                reading = false
                @ouputs << @tape[@position]  
            when ','
                reading = true                
            when '['
                reading = false
                (substring << index) if control == 0
                control += 1
            when ']'
                reading = false
                control == 1 ? (substring << index) : (control -= 1)
            else
                # begin
                #     c.to_i
                # rescue
                #     @tape = [0]
                #     @position = 0
                #     @ouputs = []
                # end
                if reading
                    stdin += c
                    @tape[@position] = stdin.to_i
                end
            end
            index += 1
            if substring.size == 2
                loopeable = instrucciones[substring[0] + 1...substring[1]]
                while @tape[@position] > 0
                    self.execute(loopeable)
                end
                index = substring[1] + 1
                substring = []
            end
        end
    end
end
