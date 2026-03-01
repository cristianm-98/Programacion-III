m = %{nombre: "Andrea", edad: 25}
IO.puts("el nombre es #{m.nombre}")
IO.puts("El nombre es #{m[:nombre]}")


IO.puts("\nAgrego un numero a la cabeza de la lista vacia")
base=[]
base=[1|base]
IO.inspect(base)

# Contatenacion de dos lista
IO.puts("\nConcatenacion de dos litas")
lista=[1,2,3,4,5]
numero_primos=[8,7,9,10,11]
todos=lista++numero_primos
IO.inspect(todos)

# Me muestra la cola de la lista
IO.puts("\nMe muestra la cola de la lista")
[_|x]=lista
IO.inspect(x)

IO.puts("\nMe muestra el primero de la lista")
[x | _] = lista
IO.inspect(x)

IO.puts("\nMe muestra el segundo de la lista")
[_|[x|_]]=lista
IO.inspect(x)

IO.puts("\nTamaño de la lista")
tamano=length(lista)
IO.inspect(tamano)


edad = 18
mensaje = if edad >18, do: "Es mayor de edad", else: "Es menor de edad"
IO.puts(mensaje)

edad=18
estado= if edad > 18, do: :mayor, else: :menor

mensaje = case estado do
  :mayor->"Eres mayor de edad"
  :menor->"Eres menor de edad"
end
IO.puts(mensaje)
