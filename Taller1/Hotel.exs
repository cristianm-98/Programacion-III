defmodule TarifaHotel do
  def main do
    numero_noche = Util.ingresar("Ingresar numeros de noche: \n", :entero)

    tipo_cliente = Util.ingresar("Escriba la opcion: Frecuente, Corportativo, Ocasional \n",:texto)
    |>String.trim()
    |>String.downcase()
    |>String.to_atom()

    temporada=Util.ingresar("Ingresar la temporada: 1. alta o 2. baja \n", :entero)

    # Calcular en orden
      tarifa_base = calcular_noche(numero_noche)
      subtotal = tarifa_base * numero_noche
      descuento = calcular_descuento(tipo_cliente, subtotal)
      recargo = calcular_recargo(temporada, subtotal)
      total = subtotal-descuento+recargo

    generar_mensaje({tarifa_base, tipo_cliente, temporada, subtotal, descuento, recargo,total})
  end

  #Guards
  def calcular_noche(numero_noche) when numero_noche >= 1 and numero_noche <= 2, do: 120000
  def calcular_noche(numero_noche) when numero_noche >= 3 and numero_noche <= 5, do: 100000
  def calcular_noche(numero_noche) when numero_noche >= 6, do: 85000
  def calcular_noche(_), do: {:error, "Numero de noches invalidas"}

  #Pattern matching con atomo
  def calcular_descuento(:frecuente, subtotal), do: subtotal * 0.20
  def calcular_descuento(:corporativo, subtotal), do: subtotal * 0.15
  def calcular_descuento(:ocasional, _subtotal), do: 0
  def calcular_descuento(_, _subtotal), do: {:error, "cliente Invalido"}

  #cond - recargo por temporada
  def calcular_recargo(temporada,subtotal) do
    cond do
      temporada == 1 -> subtotal * 0.25
      temporada == 2 -> 0
      true -> {:error, "Temporada Invalida"}
    end
  end

  #Mostrar mensaje
  def generar_mensaje({tarifa_base, tipo_cliente, temporada, subtotal, descuento, recargo, total}) do
    Util.mostrar_mensaje("la tafia base es: #{tarifa_base}")
    Util.mostrar_mensaje("el subtotal es: #{subtotal}")
    Util.mostrar_mensaje("El tipo del cliente es #{tipo_cliente}, El descuento es: #{descuento}")
    Util.mostrar_mensaje("La temporada es #{temporada}, y el recargo con la temporada: #{recargo}")
    Util.mostrar_mensaje("y el total fue #{total}")
  end

  def generar_mensaje({:error, mensaje}) do
    Util.mostrar_mensaje("Error, #{mensaje}")
  end
end
TarifaHotel.main()
