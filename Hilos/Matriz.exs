defmodule Ejercicio do

  # La matriz
  def matriz do
    [[60, 22, 41,  5],
     [13, 33, 44,  5],
     [89, 10, 100, 99],
     [ 5, 101,  6, 34]]
  end

  # S1 — Suma encima de la diagonal (col > fila) recursiva
  def suma_encima(_, fila, acc) when fila == 4, do: acc

  def suma_encima(m, fila, acc) do
    fila_actual = Enum.at(m, fila)
    suma = fila_actual
           |> Enum.with_index()
           |> Enum.filter(fn {_, c} -> c > fila end)
           |> Enum.map(fn {v, _} -> v end)
           |> Enum.sum()

    suma_encima(m, fila + 1, acc + suma)
  end

  # S2 — Promedio debajo de la diagonal (col < fila)
  def promedio_debajo(m) do
    lista = for {fila, i} <- Enum.with_index(m),
                {val, j} <- Enum.with_index(fila),
                j < i, do: val

                
    Enum.sum(lista) / length(lista)
  end

  # MAIN
  def main do
    m = matriz()

    # Lanzar los 2 hilos al mismo tiempo
    t1 = Task.async(fn -> suma_encima(m, 0, 0) end)
    t2 = Task.async(fn -> promedio_debajo(m) end)

    # Esperar resultados
    a = Task.await(t1)
    b = Task.await(t2)

    # S3 y S4
    c = a * b
    IO.puts("a = #{a}")
    IO.puts("b = #{b}")
    IO.puts("c = #{c}")
  end

end

Ejercicio.main()
