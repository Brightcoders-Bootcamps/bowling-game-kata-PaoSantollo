#valida que se ecuentre en el rango deseado y que sea entero
class Pinos_Validar
  attr_reader :pinos

  def initialize(pinos)
    @pinos = pinos.to_i
  end

  def valid?
    rango = 0...10
    rango.include?(pinos)
  end
end

#Tipo de tiro spare
class Spare
  def tiro_spare
  end
end

#tipo de tiro Strike
class Strike
end

#tipo de tiro Miss
class Miss
end

#La clase puntaje realiza la sumatoria de los pinos y ganador del juego
class Calcular_puntaje
  def initialize
  end

  def puntaje_total(cuadro)
    puntaje_total = 0
    for indice_cuadro in 1..10
      puntaje_total = puntaje_total + cuadro[indice_cuadro]
      print cuadro[indice_cuadro]
    end
    print "Puntaje total: ", puntaje_total
  end

  def puntaje_cuadro(intento, indice_intento)
    puntaje_cuadro = 0
    puntaje_cuadro = intento[indice_intento].to_i + intento[indice_intento - 1].to_i
    print "Puntaje del cuadro", puntaje_cuadro
    return puntaje_cuadro
  end

end

#pide los tiros para ese cuadro y arroja ganador del cuadro
class Cuadro
  attr_reader :indice_intento
  attr_writer :indice_intento
  attr_reader :indice_cuadro
  attr_writer :indice_cuadro
  attr_reader :num_oportunidad
  attr_reader :cuadro
  attr_reader :intento
  attr_reader :calcular

  def initialize
    @cuadro = Array.new(11, 0)
    @intento = Array.new(22, 0)
    @calcular = Calcular_puntaje.new
    @indice_intento = 0
    @indice_cuadro = 0
  end

  def partida_cuadro(pedir)
    for numcuadro in 1..1
      oportunidad(pedir)
    end
  end

  def guardar_oportunidad(pinos)
    @indice_intento = @indice_intento + 1
    intento[indice_intento] = pinos
    print "guarda indice", indice_intento, "valor", intento[indice_intento]
    guardar_cuadro
  end

  def guardar_cuadro
    if indice_intento == 2
      puts "if si "
      @indice_cuadro = @indice_cuadro + 1
      cuadro[indice_cuadro] = calcular.puntaje_cuadro(intento, indice_intento)
      print "ret", cuadro[indice_cuadro]
    end
  end

  def oportunidad(pedir)
    for num_oportunidad in 1..2
      puts "num op es ", num_oportunidad, "indice", indice_intento
      pedir.preguntar_tiro
      pedir.validar_tiro
    end
  end
end

#logica del juego
class Juego
end

#Pide al usuario ingresar los tiros y los valida
class Tiro
  attr_reader :tiro
  attr_reader :pinos
  attr_reader :cuadro

  def initialize
    @cuadro = Cuadro.new
    @tiro = Pinos_Validar.new(pinos)
  end

  def preguntar_tiro
    puts "\n Tiro"
    STDOUT.flush
    @pinos = gets.chomp
  end

  def validar_tiro
    if tiro.valid?
      puts "valido " + pinos
      cuadro.guardar_oportunidad(pinos)
    else
      puts "Tiro invalido"
    end
  end
end

pedir = Tiro.new
cuadro = Cuadro.new
cuadro.partida_cuadro(pedir)
