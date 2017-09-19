class CowsController < ApplicationController
  def index
  end

  def cowResult
    @holstein = {name: 'Holstein', score: 0, image: "/holstein.jpg", desc: "You're a little unpredictable! You like to walk on the wild side and you love raising reactions out of people. You can be a bit hot-headed and unfocused, but your sense of adventure draws people in, creating solid friendships. Your lucky numbers are 33 and 7, and your biggest fear is nuclear war! Dun dun dunnn!"}
    @angus = {name: 'Angus', score: 0, image: "/angusc.jpg", desc: "You're an old soul who enjoys the simple things in life. Your friendships are deep, and you never leave friends behind. You feel most comfortable at home with your dog, or enjoying a book by yourself in a park. People are drawn to you because of your calming energy. You're the friend everyone can rely on. Your lucky numbers are 99 and 6, and your biggest fear is someone else's disappointment in you. Dun dun dunnn!"}
    @jersey = {name: 'Jersey', score: 0, image: "/jerseyc.jpg", desc: "You are the party cow! While soft and approachable on the outside, you have a crazy party side! You can be flighty and judgmental, but you're extremely loyal to your friends. You are usually caught day dreaming while you're supposed to be working, and you're a weekend warrior! Your lucky numbers are 49 and 5, and your biggest fear is too much responsibility! Dun dun dunnn!"}
    @brown = {name: 'Brown', score: 0, image: "/brownc.jpg", desc: "You tend to be on the softer side! You like your alone time and don't let people in easily. You can surprise people by being spontaneous, but you never get too out of control. Your lucky numbers are 24 and 3, and your biggest fear is fear itself! Dun dun dunnn!"}
    @highland = {name: 'Highland', score: 0, image: "/highlandcc.jpg", desc: "You walk a fine line of living an introverted and extroverted lifestyle. You easily make friends and have strong opinions. You're easy-going and funny, and have the potential to be a natural leader if you focus yourself. Your lucky numbers are 9 and 17, and your biggest fear is abandonment! Dun dun dunnn!"}


      @errors = false

      if params[:color] == "yellow"
        @brown[:score] += 1
      elsif params[:color] == "green"
        @angus[:score] += 1
      elsif params[:color] == "pink"
        @highland[:score] += 1
      elsif params[:color] == nil
        @errors = true
      end

      if params[:animal] == "cows"
        @angus[:score] += 1
      elsif params[:animal] == "dogs"
        @jersey[:score] += 1
      elsif params[:animal] == "lizard"
        @holstein[:score] += 1
      elsif params[:animal] == nil
        @errors = true
      end

      if params[:meeting] == "excited"
        @brown[:score] += 1
      elsif params[:meeting] == "nervous"
        @angus[:score] += 1
      elsif params[:meeting] == "homebody"
        @highland[:score] += 1
      elsif params[:meeting] == nil
        @errors = true
      end

      if params[:death] == "pizza"
        @jersey[:score] += 1
      elsif params[:death] == "sushi"
        @holstein[:score] += 1
      elsif params[:death] == "milkshake"
        @angus[:score] += 1
      elsif params[:death] == nil
        @errors = true
      end

      if params[:vacations] == "no"
        @brown[:score] += 1
      elsif params[:vacations] == "light"
        @holstein[:score] += 1
      elsif params[:vacations] == "everything"
        @highland[:score] += 1
      elsif params[:vacations] == nil
        @errors = true
      end

      if params[:alcohol] == "tequila"
        @jersey[:score] += 1
      elsif params[:alcohol] == "whiskey"
        @highland[:score] += 1
      elsif params[:alcohol] == "beer"
        @brown[:score] += 1
      elsif params[:alcohol] == nil
        @errors = true
      end

      if params[:friend] == "one"
        @jersey[:score] += 1
      elsif params[:friend] == "five"
        @brown[:score] += 1
      elsif params[:friend] == "whole"
        @highland[:score] += 1
      elsif params[:friend] == nil
        @errors = true
      end

      if params[:shop] == "target"
        @jersey[:score] += 1
      elsif params[:shop] == "joes"
        @holstein[:score] += 1
      elsif params[:shop] == "wfoods"
        @angus[:score] += 1
      elsif params[:shop] == nil
        @errors = true
      end

      if params[:celebs] == "amy"
        @highland[:score] += 1
      elsif params[:celebs] == "michelle"
        @holstein[:score] += 1
      elsif params[:celebs] == "prince"
        @angus[:score] += 1
      elsif params[:celebs] == nil
        @errors = true
      end

      if params[:song] == "bruce"
        @holstein[:score] += 1
      elsif params[:song] == "kesha"
        @jersey[:score] += 1
      elsif params[:song] == "journey"
        @brown[:score] += 1
      elsif params[:song] == nil
        @errors = true
      end

      if @errors == true
        flash[:errors] = "Looks like you missed a question!"
        redirect_to :root
        return
      end

      puts([@brown[:score], @highland[:score], @angus[:score], @jersey[:score], @holstein[:score]])

      @max = [@brown[:score], @highland[:score], @angus[:score], @jersey[:score], @holstein[:score]].max
      @cowMax = [@brown, @highland, @holstein, @angus, @jersey]
      @yourResult = @cowMax.max(2){|a, b| a[:score] <=> b[:score]}


      if @yourResult[0][:score]> @yourResult[1][:score]
        session[:high_score] = @yourResult
        session[:cow] = {}
        session[:cow] = @yourResult[0]
        redirect_to :result
      else
        if @angus[:score] == @highland[:score] && @angus[:score] == @max && @highland[:score] == @max
        @cowOne = "angus"
        @cowTwo = "highland"
        session[:cow_one] = @angus
        session[:cow_two] = @highland
        @question = "Were you popular in high school, or a nerd?"
        @optionOne = "I was very popular!"
        @optionTwo = "I was such a nerd!"

      elsif @jersey[:score] == @holstein[:score] && @jersey[:score] == @max && @holstein[:score] == @max
        @cowOne = "jersey"
        @cowTwo = "holstein"
        session[:cow_one] = @jersey
        session[:cow_two] = @holstein
        @question = "Is Pepsi okay?"
        @optionOne = "What kind of restaurant is this?"
        @optionTwo = "Yes!"

      elsif @brown[:score] == @holstein[:score] && @brown[:score] == @max && @holstein[:score] == @max
        @cowOne == "brown"
        @cowTwo == "holstein"
        session[:cow_one] = @brown
        session[:cow_two] = @holstein
        @question == "Is Pluto still a planet in your eyes?"
        @optionOne == "I don't have any planets in my eyes."
        @optionTwo == "Yes, I'll always love little Pluto!"

      elsif @highland[:score] == @holstein[:score] && @highland[:score] == @max && @holstein[:score] == @max
        @cowOne = "highland"
        @cowTwo = "holstein"
        session[:cow_one] = @highland
        session[:cow_two] = @holstein
        @question = "Burritos or Tacos?"
        @optionOne = "Burritos, please!"
        @optionTwo = "Take me to the tacos!"

      elsif @angus[:score] == @holstein[:score] && @angus[:score] == @max && @holstein[:score] == @max
        @cowOne = "angus"
        @cowTwo = "holstein"
        session[:cow_one] = @angus
        session[:cow_two] = @holstein
        @question = "Butterflies, or bumblebees?"
        @optionOne = "Float like a butterfly!"
        @optionTwo = "Sting like a bee!"

      elsif @brown[:score] == @jersey[:score] && @brown[:score] == @max && @jersey[:score] == @max
        @cowOne = "brown"
        @cowTwo = "jersey"
        session[:cow_one] = @brown
        session[:cow_two] = @jersey
        @question = "Was the moon landing staged?"
        @optionOne = "Yeah, it was fake news."
        @optionTwo = "No, Neil and Buzz would never lie to us!"

      elsif @jersey[:score] == @highland[:score] && @jersey[:score] == @max && @highland[:score] == @max
        @cowOne = "jersey"
        @cowTwo = "highland"
        session[:cow_one] = @jersey
        session[:cow_two] = @highland
        @question = "Red Sox or Yankees?"
        @optionOne = "SWEEEET CAARROOOLIIIIINE!"
        @optionTwo = "I'm unfortunately a Yankees fan."

      elsif @jersey[:score] == @angus[:score] && @jersey[:score] == @max && @angus[:score] == @max
        @cowOne = "jersey"
        @cowTwo = "angus"
        session[:cow_one] = @jersey
        session[:cow_two] = @angus
        @question = "Are you an excellent speller or a bad speller?"
        @optionOne = "I am an excellent speller."
        @optionTwo = "I crant sprool very gr8."

      elsif @brown[:score] == @highland[:score] && @brown[:score] == @max && @highland[:score] == @max
        @cowOne = "brown"
        @cowTwo = "highland"
        session[:cow_one] = @brown
        session[:cow_two] = @highland
        @question = "Summer or winter?"
        @optionOne = "In the summertime, when the weather is fine..."
        @optionTwo = "Do you wanna build a snowman?"

      elsif @brown[:score] == @angus[:score] && @brown[:score] == @max && @angus[:score] == @max
        @cowOne = "brown"
        @cowTwo = "angus"
        session[:cow_one] = @brown
        session[:cow_two] = @angus
        @question = "Nike or New Balance?"
        @optionOne = "I love the swoosh."
        @optionTwo = "New Balance!"
      end
      render :tiebreaker
    end
  end

  def result
    puts @cowMax

    @cowMax = session[:cow]
    session[:cow]
  end

  def tiebreaker
    if params[:answer] == "one"
      session[:cow] = {}
      session[:cow] = session[:cow_one]
    else
      session[:cow] = {}
      session[:cow] = session[:cow_two]
    end
    redirect_to :result
  end

  def reset
    reset_session
    redirect_to :root
  end
end
