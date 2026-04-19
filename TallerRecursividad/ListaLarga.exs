defmodule ListaLarga do
  def main do
    lista=["Hola", "Recursividad", "Programacion", "Elixir"]
    resultado= largo(lista)
    Util.mostrar_mensaje("La cadena larga es #{resultado}")
  end

  def largo([]), do: ""

  def largo([cabeza | cola]) do
    larga = String.length(cabeza)
    resto = largo(cola)
    if larga > String.length(resto) do
      cabeza
    else
      resto
    end
  end
end
ListaLarga.main()
