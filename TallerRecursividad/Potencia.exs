defmodule Potencia do
  def main do
    num1 = Util.ingresar("Ingrese el primer numero: ", :entero)
    num2 = Util.ingresar("Ingrese el segundo numero: ", :entero)
    resultado = es_potencia(num1, num2)
    Util.mostrar_mensaje("El #{num1} es potencia de #{num2}, #{resultado}")
  end

  def es_potencia(_num1 , num2) when num2 < 2, do: false
  def es_potencia(num1 , num2) when num1 == num2, do: true
  def es_potencia(1, _num2), do: true

  def es_potencia(num1, num2) do
    if rem(num1, num2)!=0 do
      false
    else
      es_potencia(div(num1,num2), num2)
    end
  end
end
Potencia.main()
