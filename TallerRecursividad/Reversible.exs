defmodule Reversible do
  def main do
    numero= Util.ingresar("Ingrese un numero entero positivo: ", :entero)
    resultado = es_reversible(numero)
    Util.mostrar_mensaje("El numero #{numero} es reversible #{resultado}")
  end

  def es_reversible(numero) when numero <= 0, do: false

  def es_reversible(n) do
    invertido= invertir(n,0)
    suma= n + invertido
    todos_impares(suma)
  end

  def invertir(0, acc), do: acc
  def invertir(n,acc) do
    invertir(div(n,10), acc * 10 + rem(n,10))
  end

  def todos_impares(0), do: true
  def todos_impares(n) do
    if rem(rem(n,10),2)!=0 do
      todos_impares(div(n,10))
    else
      false
    end
  end
end
Reversible.main()
