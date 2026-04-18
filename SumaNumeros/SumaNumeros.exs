defmodule SumaNumeros do
  def main do
    n=5
    resultado=imprimir_suma(n,0)
    IO.puts("la suma de los numeros son #{resultado}")
  end
  #Caso base
  defp imprimir_suma(0,acum) do
    acum
  end
  #Recursividad
  defp imprimir_suma(n,acum) do
    imprimir_suma(n-1,acum+n)
  end

end
SumaNumeros.main()
