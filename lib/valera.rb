class Valera
  attr_accessor :status

  def initialise(health = 100, mana = 100, fun = 0, money = 0, fatigue = 0)
    @status = {
      'health' => health,
      'mana' => mana,
      'fun' => fun,
      'money' => money,
      'fatigue' => fatigue
    }
  end

  def dead?(status)
    return true if status['health'] <= 0
    return true if status['fatigue'] >= 100

    false
  end
end
