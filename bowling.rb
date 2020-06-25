#La clase tiro valida que se ecuentre en el rango deseado y que sea entero
class Tiro
  attr_reader :pinos

  def initialize(pinos)
    @pinos = pinos.to_i
    print "pinos", pinos
  end

  def valid?
    rango = 0...10
    rango.include?(pinos)
  end
end

#Tipo de tiro spare
class Spare < Tiro
end

#tipo de tiro Strike
class Strike < Tiro
end

#tipo de tiro Miss
class Miss < Tiro
end

#La clase puntaje realiza la sumatoria de los pinos y ganador del juego
class Puntaje
  attr_reader :pinos

  def initialize
  end

  def puntaje_total
  end

  def ganador
  end
end

#pide los tiros para ese cuadro y arroja ganador del cuadro
class Cuadro
end

#logica del juego, los turnos de los participantes
class Juego
end

#Pide al usuario ingresar los tiros
class Pedir_tiro
  def initialize
  end

  def preguntar_tiro
  end
end

for i in 1..1
  puts "Tiro"
  STDOUT.flush
  pinos = gets.chomp
  tiro = Tiro.new(pinos)
  for j in 1..1
    if tiro.valid?
      puts "valido " + pinos
    else
      puts "Tiro invalido"
    end
  end
end
