defmodule Parqueadero do
  def main do
    hora = Util.ingresar("Ingrese las horas de permanencia: ", :entero)

    tipo_cliente =
      Util.ingresar("Ingrese el tipo de cliente: \n1. Frecuente \n2. Regular \n", :entero)

    tipo_vehiculo =
      Util.ingresar("Ingrese el tipo de vehiculo: \n1. Electrico \n2. Convencional \n", :entero)

    dia = Util.ingresar("Ingrese el dia: \n1. Fin de semana \n2. Entre semana \n", :entero)

    tarifa_hora = calcular_tarifa_base(hora)
    calcular_descuento(tarifa_hora, tipo_cliente, tipo_vehiculo, dia) |> generar_mensaje()
  end

  def calcular_tarifa_base(hora) do
    cond do
      hora >= 1 and hora <= 2 -> 3000
      hora >= 3 and hora <= 5 -> 2500
      hora >= 6 and hora <= 8 -> 2000
      hora > 8 -> 18000
    end
  end

  def calcular_descuento(tarifa_hora, tipo_cliente, tipo_vehiculo, dia) do
    descuento_cliente = if tipo_cliente == 1, do: 0.15, else: 0
    descuento_vehiculo = if tipo_vehiculo == 1, do: 0.20, else: 0
    descuento_dia = if dia == 1, do: 0.10, else: 0

    descuento_total = descuento_cliente + descuento_vehiculo + descuento_dia
    tarifa_descuento = round(tarifa_hora - (tarifa_hora * descuento_total))
    {:mensaje, {tarifa_hora, tarifa_descuento}}
  end

  def generar_mensaje({:mensaje, {tarifa_hora, tarifa_descuento}}) do
    Util.mostrar_mensaje("=====Factura====")

    Util.mostrar_mensaje(
      "Tarifa sin descuento: $#{tarifa_hora} \nCon el descuento es $#{tarifa_descuento}"
    )
  end
end

Parqueadero.main()
