defmodule Valicacion do
  def main()
  "Ingrese su nombre: "
  |>Util.ingresar(:texto)

  "ingresar su edad: "
  |>Util.ingresar(:entero)

  "Validar credenciales: "
  |>Util.ingresar(:texto)

  "Ingrese los intentos"
  |>Util.ingresar(:entero)

  defp Validacion_credenciales(nombre,edad,)

  defp menor_edad(edad) do
    if(edad<18) do
      ":ok, eres mayor de edad"
    else
      ":Error, no es mayor de edad"
    end
  end










  |>generar_mensaje
  |>Util.mostrar_mensaje(:texto)
end
Validacion.main()
