defmodule ContarVocalesG do
  def main do
    cadena=Util.ingresar("ingrese la palabra: ", :texto)
    total = contar(cadena)
    Util.mostrar_mensaje("El total de las vocales son: #{total}")
  end

  def contar(""), do: 0

  def contar(cadena) do
    letra= String.first(cadena)
    resto=String.slice(cadena, 1..-1//1)
    es_vocal= String.downcase(letra) in ["a" , "e", "i", "o", "u"]
    if es_vocal do
      1+contar(resto)
    else
      contar(resto)
    end
  end
end
ContarVocalesG.main()
