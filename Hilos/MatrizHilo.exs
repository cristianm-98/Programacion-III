defmodule Ejercicio do

  def matriz do
    [[60,22,41,5],
    [13,33,44,5],
    [89,10,100,99],
    [5,101,6,34]]
    
  end

  # S1 — Suma encima diagonal (recursiva)
  def suma_encima(matriz, fila \\ 0, acc \\ 0) do
    if fila >= length(matriz) do
      acc
    else
      fila_actual = Enum.at(matriz, fila)

      suma_fila =
        fila_actual
        |> Enum.with_index()
        |> Enum.filter(fn {_, col} -> col > fila end)
        |> Enum.map(fn {val, _} -> val end)
        |> Enum.sum()

      suma_encima(matriz, fila + 1, acc + suma_fila)
    end
  end

  # S2 — Promedio debajo diagonal
  def promedio_debajo(matriz) do
    elementos =
      matriz
      |> Enum.with_index()
      |> Enum.flat_map(fn {fila, i} ->
        fila
        |> Enum.with_index()
        |> Enum.filter(fn {_, j} -> j < i end)
        |> Enum.map(fn {val, _} -> val end)
      end)

    Enum.sum(elementos) / length(elementos)
  end

  def main do
    m = matriz()

    # t1 ejecuta S1 — Task.async lanza el hilo
    t1 = Task.async(fn -> suma_encima(m) end)

    # t2 ejecuta S2 — Task.async lanza el hilo
    t2 = Task.async(fn -> promedio_debajo(m) end)

    # Main espera que t1 y t2 terminen — Task.await
    a = Task.await(t1)
    b = Task.await(t2)

    # S3 y S4
    c = a * b
    IO.puts("a = #{a}")
    IO.puts("b = #{b}")
    IO.puts("c = a * b = #{c}")
  end

end

Ejercicio.main()
