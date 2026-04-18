#Suma de lista recursividad con acumulador
defmodule SumaLista do
  def main do
    lista = [1,2,3,4,5]
    sumar_lista(lista , 0)
  end
  #Caso base
  def sumar_lista([], acum) do
    IO.puts("La suma de la lista es: #{acum}")
  end
  #Ejecucion de la recursividad
  def sumar_lista([x|lista],acum) do
    sumar_lista(lista, x + acum)
  end
end
SumaLista.main()
