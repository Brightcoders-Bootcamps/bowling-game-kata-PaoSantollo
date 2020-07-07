#valida que se ecuentre en el rango deseado y que sea entero
class PinosValidar
  attr_reader :pinos

  def initialize(pinos)
    @pinos = pinos.to_i
  end

  def valid?(limite_rango)
    rango = 0...limite_rango
    rango.include?(pinos)
  end
end

#La clase puntaje realiza la sumatoria de los pinos y ganador del juego
class CalcularPuntaje
  attr_reader :impresion

  def initialize
    @impresion = Impresiones.new
  end

  def puntaje_total(intento)
    puntaje = 0
    for indice_intento in 1..22
      puntaje = puntaje + intento[indice_intento].to_i
    end
    impresion.imprimir_resultado(puntaje)
  end
end

#pide los tiros para ese cuadro y arroja ganador del cuadro
class Cuadro
  attr_reader :indice_intento, :intento, :limite

  def initialize
    @intento = Array.new(22, 0)
    @indice_intento = 0
  end

  def guardar_oportunidad(pinos)
    @indice_intento = @indice_intento + 1
    intento[indice_intento + 1] = pinos
    ultimo_intento
  end

  def ultimo_intento
    if indice_intento == 20
      impresion = Impresiones.new
      impresion.imprimir_tablero(intento)
      calculo = CalcularPuntaje.new
      calculo.puntaje_total(intento)
    end
  end
end

#Pide al usuario ingresar los tiros y los valida
class Tiro
  attr_reader :tiro, :pinos, :limite, :impresion

  def initialize
    @impresion = Impresiones.new
  end

  def preguntar_tiro
    impresion.impresion_pedir_tiro
    @pinos = gets.chomp
    @tiro = PinosValidar.new(pinos)
  end

  def partida_cuadro
    for numcuadro in 1..10
      impresion = Impresiones.new
      impresion.impresion_cuadro(numcuadro)
      oportunidad
    end
  end

  def oportunidad
    for num_oportunidad in 1..2
      if num_oportunidad == 1 && pinos == 10
        num_oportunidad = 2
      end
      preguntar_tiro
      validar_tiro(num_oportunidad)
    end
  end

  def validar_tiro(num_oportunidad)
    cuadro = Cuadro.new
    limite = limite_tiros(num_oportunidad)
    if tiro.valid?(limite)
      cuadro.guardar_oportunidad(pinos)
    else
      impresion.impresion_error
      preguntar_tiro
    end
  end

  def limite_tiros(num_oportunidad)
    pinos_anterior = pinos
    @limite = 11
    if num_oportunidad == 2
      @limite = 10 - pinos_anterior.to_i
    end
    return limite
  end
end

#impresiones del juego
class Impresiones
  def impresion_pedir_tiro
    puts "\n Ingresa tu tiro: "
    STDOUT.flush
  end

  def impresion_cuadro(numcuadro)
    print "Cuadro ", numcuadro
  end

  def impresion_error
    print "Tiro invalido, favor de ingresar otro tiro"
  end

  def imprimir_resultado(puntaje)
    print "\n Puntaje total: ", puntaje
  end

  def imprimir_tablero(intento)
    for indice in 1..22
      imprimir_spare
      imprimir_miss
      print " ", intento[indice]
    end
  end

  def imprimir_strike
    if intento[indice].to_i == 10
      print "X"
    end
  end

  def imprimir_spare
    print "/"
  end

  def imprimir_miss
    if intento[indice].to_i == 0
      print "- "
    end
  end
end

pedir = Tiro.new
cuadro = Cuadro.new
pedir.partida_cuadro
