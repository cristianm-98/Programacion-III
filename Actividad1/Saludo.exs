defmodule Saludo do
  def main do
    nombre_usuario = Util.ingresar("Ingrese su nombre: ", :texto)
    {_fecha, {hora, _minuto, _seg}} = :calendar.local_time()
    saludo_hora(nombre_usuario,hora) |>generar_mensaje()

  end

  def saludo_hora(nombre,hora) do
    cond do
      hora>=0 and hora<=11 -> {:mensaje, "Buenos dias #{nombre}"}
      hora>=12 and hora<=17 -> {:mensaje, "Buenos tardes #{nombre}"}
      hora>=18 and hora<=23 -> {:mensaje, "Buenos noches #{nombre}"}
    end
  end

  def generar_mensaje({:mensaje, mensaje}) do
    Util.mostrar_mensaje(mensaje)
  end

end
Saludo.main()
