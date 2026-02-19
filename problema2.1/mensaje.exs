defmodule EntradaDatos do
  def main do
    "Ingrese nombre el empleado: "
    |>Util.ingresar(:texto)
    |>generar_mensaje()
    |>Util.mostrar_mensaje()
  end

  defp generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end
EntradaDatos.main
