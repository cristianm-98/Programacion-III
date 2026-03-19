defmodule ValidacionCupon do
  def main do

    cupon=Util.ingresar("Ingrese el cupon: ", :texto)
    validacion_cupon(cupon) |> generar_mensaje()

    def validacion_cupon(cupon) do
      errores=[]

      errores=
      if String.length(cupon)>10 do
        errores ++ ["Debe tener al menos 10 caracteres"]
      else
        errores
      end

      errores=
        if String.downcase(cupon)==cupon do
          errores ++ ["Debe contener una letra mayuscula"]
        else
          errores
        end

        errores =
          if String.contains?(cupon,[~r/[0-9]/]) do
            errrores ++ ["Debe contener al menos un numero"]
          else
            errorres
          end
        errores =
          if String.contains?(cupon,"") do
            errores ++ ["No debe contener espacios"]
          else
            errores
          end

          if errores == [] do
            {:ok, "Cupon valido"}
          else
            {:error, errores}
          end
    end
  end
end
ValidacionCupon.main()
