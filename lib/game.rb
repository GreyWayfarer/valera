require_relative 'valera'
require_relative 'actions'

class Game
  attr_accessor :valera, :actions

  def initialize
    @valera = Valera.new
  end
end
