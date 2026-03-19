defmodule MatrushkaRecursivo do
  def main do
    numero=Util.ingresar("ingrese un numero: ", :entero)
    imprimir_recursividad(numero)
  end

  def imprimir_recursividad(1) do
    IO.puts("Abriendo Matrushka 1")
    IO.puts("Cerrando Matrushka 1")

  end

  def imprimir_recursividad(numero) when numero > 1 do
    IO.puts("Abriendo Matrushka #{numero}")
    imprimir_recursividad(numero - 1)
    IO.puts("Cerrando Matrushka #{numero}")

  end
end
MatrushkaRecursivo.main()
