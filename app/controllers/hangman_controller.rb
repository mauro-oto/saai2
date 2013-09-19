# encoding: utf-8

class HangmanController < ApplicationController

  def index
    resetGame()
    redirect_to hangman_game_path
  end

  def game

    if !session[:current_word]
      resetGame()
    end

    if session[:turns_left] > 0 && params[:letter] && params[:letter].length > 0

      session[:turns_left] -= 1

      if !UnicodeUtils.upcase(session[:used_letters]).include?(UnicodeUtils.upcase(params[:letter].chars.first))
        session[:used_letters] += UnicodeUtils.upcase(params[:letter].chars.first)
      end

    end

    @turns_left = session[:turns_left]
    @used_letters = session[:used_letters]
    @word = []
    @correct_letters = 0

    session[:current_word].each do |letter|
      if UnicodeUtils.upcase(@used_letters).include?(UnicodeUtils.upcase(letter))
        @word.push(UnicodeUtils.upcase(letter))
        @correct_letters += 1
        if @correct_letters == session[:current_word].length
          current_user.puntosPrivados = current_user.puntosPrivados + 10
          current_user.save
        end
      else
        @word.push("_")
      end
    end

  end

  private
    def resetGame
      #dictionary = [ "hier", "kommt", "sonne", "welt", "zählt", "laut", "zehn" ]
      #session[:current_word] = dictionary.sample.split("")
	    session[:current_word] = Fila.random_word.split("")
      session[:used_letters] = ""
      session[:turns_left] = 10
    end

end
