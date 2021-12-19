class Valera
  attr_accessor :status

  def initialize(health = 100, mana = 40, fun = 0, money = 0, fatigue = 0)
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

  def check_status!(status)
    status['health'] = 100 if status['health'] > 100
    status['mana'] = 0 if status['mana'].negative?
    status['mana'] = 100 if (status['mana']) > 100
    status['fun'] = 10 if status['fun'] > 10
    status['fun'] = -10 if status['fun'] < -10
    status['fatigue'] = 0 if status['fatigue'].negative?
  end
end
