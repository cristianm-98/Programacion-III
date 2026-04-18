#Lista recursividad sin el acumulador
defmodule SumaListaR do
  def main do
    lista=[1,2,3,4,5]
    resultado=sumar_lista(lista)
    IO.puts("La suma es #{resultado}")
  end
  def sumar_lista([]) do
    0
  end
  def sumar_lista([x|lista]) do
    x + sumar_lista(lista)
  end
end
SumaListaR.main()
