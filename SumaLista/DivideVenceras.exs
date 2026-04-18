defmodule DivideVenceras do
  def main do
    lista=[1,2,3,4,5]
    IO.puts("La suma de la lista es: #{dyv(lista)}")
  end
  #Caso Base
  def dyv([]) do
    0
  end

  #Retorna el valor de la lista
  def dyv([x]) do
    x
  end

  def dyv(lista) do
    mitad = div(length(lista),2)
    {izquierda, derecha}=Enum.split(lista, mitad)
    dyv(izquierda) + dyv(derecha)
  end
end
DivideVenceras.main()
