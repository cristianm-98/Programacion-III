defmodule ListaRecursividad do
  def main do
    lista=[1,2,3,4,5]
    imprimir_lista(lista)
  end

  def imprimir_lista([]) do
  end

  def imprimir_lista([x|lista])  do
    IO.puts("Ida #{x}")
    imprimir_lista(lista)
    IO.puts("Vuelta #{x}")
  end
end
ListaRecursividad.main()
