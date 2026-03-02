defmodule ValidacionUsuario do
  def main do
    usuario = Util.ingresar("Ingrese el usuario: ", :texto)
    validacion_usuario(usuario) |> mostrar_mensaje()
  end

  def validacion_usuario(usuario) do
    errores = []

    errores =
      if String.length(usuario) < 5 or String.length(usuario) > 12,
        do: errores ++ ["Debe tener entre 5 y 12 caracteres"],
        else: errores

    errores =
      if String.downcase(usuario) != usuario,
        do: errores ++ ["Debe estar en minusculas"],
        else: errores

    errores =
      if String.contains?(usuario, " "),
        do: errores ++ ["No debe contener espacios"],
        else: errores

    errores =
      if String.contains?(usuario, ["@", "#", "$", "%"]),
        do: errores ++ ["No debe contener caracteres especiales"],
        else: errores

    errores =
      if String.replace(usuario, ~r/[a-z]/, "") == usuario,
        do: errores ++ ["Debe contener al menos una letra"],
        else: errores

    if errores == [], do: {:ok, "Usuario Valido"}, else: {:error, errores}
  end

  def mostrar_mensaje({:ok, mensaje}) do
    Util.mostrar_mensaje(mensaje)
  end

  def mostrar_mensaje({:error, errores}) do
    Util.mostrar_mensaje("Usuario Invalido: ")
    Enum.each(errores, fn error -> Util.mostrar_mensaje("- #{error}") end)
  end
end

ValidacionUsuario.main()
