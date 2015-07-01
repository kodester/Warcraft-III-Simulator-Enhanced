class Seige_engine<Unit
  attr_accessor :health_points, :attack_power

  def initialize
    super(400,50)
  end
  
  def attack!(enemy)
    if enemy.is_a?(Barracks)
      enemy.damage(attack_power*2)
    elsif enemy.is_a?(Seige_engine)
      enemy.damage(attack_power)
    else
      enemy.damage(attack_power=0)
    end
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

end