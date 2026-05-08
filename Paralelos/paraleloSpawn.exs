defmodule Proceso do
  @cantidad_procesos_internos 5

  def main do
    Benchmark.determinar_tiempo_ejecucion({Proceso, :simulacion, [@cantidad_procesos_internos]})
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  def simulacion() do
    datos_prueba = [{"A", 2500}, {"\tB", 1500}, {"\t\tC", 500}, {"\t\t\tD", 3500}]
    Enum.each(datos_prueba, fn valor -> spawn(fn -> simulando_procesos(valor, cantidad_procesos_internos) end) end)
  end

  def simulando_procesos({mensaje, demora}, cantidad_procesos_internos) do
    IO.puts("#{mensaje} -> (inicia)")

     Enum.each(1..cantidad_procesos_internos, fn i -> :timer.sleep(demora)
     IO.puts("\t#{mensaje} - #{i}") end)

     IO.puts("#{mensaje} -> (Finalizada)")
  end

  def generar_mensaje(tiempo), do: "\nEl tiempo de ejecucion es de #{tiempo} microsegundos."

end
Proceso.main()
