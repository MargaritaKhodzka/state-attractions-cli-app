class StateAttractions::CLI

  def call
    StateAttractions::Scraper.new.make_states
    puts "Welcome, Traveller! Which state do you want to learn more about?"
    list_states
    menu
  end

  def list_states
    states = StateAttractions::State.all
    states.each.with_index(1) do |state, i|
      puts "#{i}. #{state.name}"
    end
  end

  def menu
    input = nil
    until input == "exit"
      puts "Enter the number of the state you would like more information on [1-50], type [list] to see the states again, or type [exit]:"
      input = gets.strip

      if input.to_i.between?(1, StateAttractions::State.all.size)
        the_state = StateAttractions::State.find(input.to_i - 1)
        puts "#{the_state.name} - #{the_state.attraction}\nLearn more: #{the_state.url}"
      elsif input == "list"
        list_states
      elsif input == "exit"
        puts "See you next time!!!"
      else
        puts "Not sure what you want. Enter the number of the state you would like more information on [1-50], type [list] to see the states again, or type [exit]:"
      end
    end
  end

end
