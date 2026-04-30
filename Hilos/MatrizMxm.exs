defmodule Ejercicio do
  def main do
    m = [[60, 22, 41,  5],
         [13, 33, 44,  5],
         [89, 10, 100, 99],
         [ 5, 101,  6, 34]]

    t1 = Task.async(fn -> encima(m, 0) end)
    t2 = Task.async(fn ->
      lista = debajo(m, 0)
      sumar(lista) / contar(lista)
    end)

    a = Task.await(t1)
    b = Task.await(t2)

    IO.puts("a = #{a}")
    IO.puts("b = #{b}")
    IO.puts("c = #{a * b}")
  end

  #Suma una lista
  defp sumar([]),       do: 0
  defp sumar([h | t]),  do: h + sumar(t)

  #Cuenta una lista
  defp contar([]),      do: 0
  defp contar([_ | t]), do: 1 + contar(t)

  #S1: Suma encima diagonal (col > fila)
  defp encima([], _),      do: 0
  defp encima([f | t], i), do: encima_fila(f, i, 0) + encima(t, i + 1)

  defp encima_fila([], _, _),          do: 0
  defp encima_fila([h | t], fila, col) do
    val = if col > fila, do: h, else: 0
    val + encima_fila(t, fila, col + 1)
  end

  #S2: Recoge debajo diagonal (col < fila)
  defp debajo([], _),      do: []
  defp debajo([f | t], i), do: debajo_fila(f, i, 0) ++ debajo(t, i + 1)

  defp debajo_fila([], _, _),          do: []
  defp debajo_fila([h | t], fila, col) do
    resto = debajo_fila(t, fila, col + 1)
    if col < fila, do: [h | resto], else: resto
  end
end
Ejercicio.main()
