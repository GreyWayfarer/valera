class Valera
  attr_accessor :money
  attr_reader :health, :mana, :fun, :fatique

  def initialise(health: 100, mana: 100, fun: 0, money: 0, fatique: 0)
    self.health = health
    self.mana = mana
    self.fun = fun
    self.money = money
    self.fatique = fatique
  end

  def dead?
    health <= 0 || fun <= -10
  end
end
