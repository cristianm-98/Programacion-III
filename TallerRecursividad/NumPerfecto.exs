defmodule EsPerfecto do
  def main do
    n = Util.ingresar("Ingrese un numero: ", :entero)
    resultado = es_perfecto(n,1,0)
    Util.mostrar_mensaje("El numero #{n} es perfecto #{resultado}")
  end

  def es_perfecto(1,_,_), do: true
  def es_perfecto(n,divisor,suma) when divisor >= n, do: n == suma
  def es_perfecto(n,divisor,suma) do
    if rem(n,divisor)==0 do
      es_perfecto(n, divisor + 1, suma + divisor)
    else
      es_perfecto(n, divisor + 1, suma)
    end
  end
end
EsPerfecto.main()
