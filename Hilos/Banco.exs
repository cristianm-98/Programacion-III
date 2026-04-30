defmodule Banco do

  def cajero do
    # self() te dice el PID de ESTE cajero
    IO.puts("Cajero #{inspect(self())} listo...")

    # Receive esperar, y lee el mensaje para luego esperar

    receive do
      {:cliente, nombre, monto} ->
        IO.puts("Cajero #{inspect(self())} atendiendo a #{nombre}...")
        IO.puts("#{nombre} retiró $#{monto}")
        cajero()

      :cerrar ->
        IO.puts("Cajero #{inspect(self())} cerrado.")
    end
  end

  def main do
    # Spawn crea y arranca el proceso
    pid1 = spawn(Banco, :cajero, [])
    pid2 = spawn(Banco, :cajero, [])

    
    send(pid1, {:cliente, "Carlos", 500_000})
    send(pid2, {:cliente, "Ana",    200_000})
    send(pid1, {:cliente, "Luis",   350_000})
    send(pid2, {:cliente, "Maria",  100_000})

    Process.sleep(2000)

    send(pid1, :cerrar)
    send(pid2, :cerrar)

    Process.sleep(500)
  end

end

Banco.main()
