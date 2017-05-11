#CLI Controller

class StateAttractions::CLI

  def call
    list_states
    menu
    goodbye
  end

  def list_states
    puts "Welcome, Traveller! Which state do you want to learn more about?"
    @states = StateAttractions::Attraction.all
    @states.each.with_index(1) do |state, i|
      puts "#{i}, #{state.name} - #{state.attraction} - #{state.description}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the state you'd like more info on, type list to see the states again, or type exit:"
      input = gets.strip

      if input.to_i > 0 && input.to_i < 51
        the_state = @states[input.to_i-1]
        puts "#{the_state.name} - #{the_state.attraction} - #{the_state.description}"
      elsif input == "list"
        list_states
      else
          puts "Not sure what you want, enter the number of the state, type list, ot type exit"
        end
      end
    end

  def goodbye
    puts "See you next time!!!"
  end

end
