defmodule ContarVocales do
  def main do
    cadena=Util.ingresar("Ingrese una palabra: ", :texto)
    letras=String.graphemes(cadena)
    resultado=contar(letras)
    Util.mostrar_mensaje("Numero de vocales son: #{resultado}")
  end

  defp contar([]), do: 0

  defp contar([cabeza | cola]) do
    letra=String.downcase(cabeza)
    es_vocal =letra in ["a", "e", "i", "o", "u"]
    if es_vocal do
      1+contar(cola)
    else
      contar(cola)
    end
  end
end
ContarVocales.main()
