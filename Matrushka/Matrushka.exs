defmodule Matrushka do
  def main do
    numero=Util.ingresar("ingrese la cantidad de Matrushka: ", :entero)
    imprimir_matrushka(numero)
  end

  def imprimir_matrushka(numero) when numero > 1 do
    for i <- numero..1 do
      IO.puts("Abriendo Matrushka #{i}")

    end
    for i <- 1..numero do
      IO.puts("Cerrando Matrushka #{i}")

    end
  end
end
Matrushka.main()
