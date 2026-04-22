defmodule Estructura do
  def main do
    "\nIngrese los datos del cliente"
    |>Cliente.ingresar(:clientes)
    |>Cliente.escribir_csv("cliente.csv")
    |>generar_mensaje_clientes()
    |>Util.mostrar_mensaje()
  end

  defp crear_lista_clientes() do
    [Cliente.crear("Ana", 16, 1.70),
    Cliente.crear("Juan", 20, 1.72),
    Cliente.crear("Diana", 48, 1.71)
  ]
  end

  defp generar_mensaje(cliente) do
    altura = cliente.altura |> Float.round(2)
    "Hola #{cliente.nombre}, tu edad es de #{cliente.edad} años y " <> "tienes una altura de #{altura}\n"
  end

  defp generar_mensaje_clientes(lista_clientes) do
    lista_clientes
    |> Enum.map(&generar_mensaje/1)
    |> Enum.join
  end
end
Estructura.main()
