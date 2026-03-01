defmodule Validacion do
  def main do

    nombre_usuario = Util.ingresar("Ingresar su nombre: ", :texto)
    edad_usuario = Util.ingresar("Ingresar su edad: " , :entero)
    credenciales_usuario = Util.ingresar("Posee una credencial S/N: " , :boolean)
    intentos_usuario=Util.ingresar("Ingrese la cantidad de intentos fallidos: ", :entero)

    validacion_credencial = validacion_usuario(nombre_usuario, edad_usuario, credenciales_usuario, intentos_usuario)
    Util.mostrar_mensaje(elem(validacion_credencial,1))
  end

  def validacion_usuario(nombre,edad,credencial,intentos) do

      unless credencial do
        {:error, "Acceso denegado #{nombre} no posee credenciales"}
      else
        if edad<18 do
          {:error, "Acceso denegado #{nombre} eres menor de edad"}
        else
          if intentos>=3 do
            {:error, "cuenta bloqueada: se registraron #{intentos} intentos"}
          else
            {:ok, "Acceso Concedido Bienvenido #{nombre}"}
          end
        end
      end
    end

    def generar_mensaje({:ok, mensaje}) do
      Util.mostrar_mensaje(mensaje)
    end

    def generar_mensaje({:error, mensaje}) do
      Util.mostrar_mensaje(mensaje)
    end

end

Validacion.main()
