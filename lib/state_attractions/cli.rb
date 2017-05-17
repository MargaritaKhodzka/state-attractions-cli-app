class StateAttractions::CLI

  def call
    StateAttractions::Scraper.new.make_states
    puts "Welcome, Traveller! Which state do you want to learn more about?"
    list_states
    menu
  end


  def list_states
    @states = StateAttractions::State.all
    @states.each.with_index do |state, i|
      puts "#{i}. #{state.name}"
    end
  end

  def menu
    input = nil
    until input == "exit"
      puts "Enter the number of the state you'd like more info on [1-50], type list to see the states again, or type exit:"
      input = gets.strip

      if input.to_i > 0 && input.to_i <= 50
        the_state = @states[input.to_i]
        puts "#{the_state.name} - #{the_state.attraction} - #{the_state.description}"
      elsif input == "list"
        list_states
      elsif input == "exit"
        puts "See you next time!!!"
      else
          puts "Not sure what you want, enter the number of the state you'd like more info on, type list to see the states again, or type exit:"
      end
    end
  end

end
