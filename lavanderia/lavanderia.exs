defmodule Semaforo do
  @moduledoc """
  Implementa un semáforo simple usando procesos y mensajes.
  Controla el acceso concurrente a un número limitado de recursos.
  """

  def iniciar(cantidad) do
    spawn(fn -> loop(cantidad, []) end)
  end

  defp loop(disponibles, en_espera) do
    receive do
      {:esperar, de} ->
        if disponibles > 0 do
          send(de, :ok)
          loop(disponibles - 1, en_espera)
        else
          send(de, :esperando)
          loop(disponibles, en_espera ++ [de])
        end

      {:señal} ->
        cond do
          en_espera != [] ->
            [siguiente | resto] = en_espera
            send(siguiente, :ok)
            loop(disponibles, resto)

          true ->
            loop(disponibles + 1, en_espera)
        end
    end
  end
end

defmodule Lavanderia do
  @moduledoc """
  Simula una lavandería con máquinas de lavado limitadas.
  Cada cliente es un proceso concurrente (task) que usa el semáforo.
  """

  def iniciar(num_clientes, num_maquinas) do
    semaforo = Semaforo.iniciar(num_maquinas)

    clientes =
      for i <- 1..num_clientes do
        Task.async(fn -> cliente(i, semaforo) end)
      end

    Enum.each(clientes, &Task.await(&1, :infinity))
  end

  defp cliente(id, semaforo) do
    IO.puts("Cliente #{id} quiere usar una máquina...")
    send(semaforo, {:esperar, self()})

    receive do
      :ok ->
        lavar(id, semaforo)

      :esperando ->
        IO.puts("Cliente #{id} espera porque no hay máquinas disponibles.")
        esperar_turno(id, semaforo)
    end
  end

  defp esperar_turno(id, semaforo) do
    receive do
      :ok ->
        IO.puts("Cliente #{id} ahora obtuvo una máquina y comienza a lavar.")
        lavar(id, semaforo)
    end
  end

  defp lavar(id, semaforo) do
    IO.puts("Cliente #{id} está lavando la ropa...")
    :timer.sleep(Enum.random(1000..3000))
    IO.puts("Cliente #{id} terminó de lavar y libera la máquina.")
    send(semaforo, {:señal})
  end
end

defmodule Principal do
  @moduledoc """
  Punto de entrada principal del programa.
  """

  def principal do
    num_clientes = 8
    num_maquinas = 3

    IO.puts("🧺 Iniciando lavandería con #{num_maquinas} máquinas y #{num_clientes} clientes...\n")
    Lavanderia.iniciar(num_clientes, num_maquinas)
    IO.puts("\n✅ Todos los clientes terminaron de lavar.")
  end
end

Principal.principal()
