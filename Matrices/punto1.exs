defmodule Matriz do
  def main do
    matriz = [[1, 2, 3],[3, 4, 5],[7, 8, 9]]
    imprimir_diagonal(matriz)

  end

  def imprimir_diagonal(matriz) do
    imprimir_diagonal(matriz,0)
  end

  def imprimir_diagonal([fila | columna] , index) do
    IO.puts(Enum.at(columna, index))
    imprimir_diagonal(columna, index + 1)
  end

  def imprimir_diagonal([], index) do
  :ok
  end
end
Matriz.main()
