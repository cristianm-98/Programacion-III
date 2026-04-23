defmodule CSV do

  def leer_csv(nombre,parser) do
    nombre
    |> File.stream!()
    |> Stream.drop(1)
    |> Enum.map(parser)
  end


  def escribir_csv(datos,nombre,titulos,parser) do
    encabezado =
      if File.exists?(nombre) do
        ""
      else
        titulos
      end
    datos
    |> generar_mensaje_csv(parser)
    |> (&(encabezado <> &1)).()
    |> (&File.write(nombre, &1, [:append])).()
    datos
  end

  def generar_mensaje_csv(datos,parser) do
    datos
    |> Enum.map(parser)
    |> Enum.join("\n")
  end


  #Funciones anterior, de otros modulos
  # def leer_csv(nombre) do
  #   nombre
  #   |> File.stream!()
  #   |> Stream.drop(1)
  #   |> Enum.map(&convertir_cadena_cliente/1)
  # end

  # def escribir_csv(clientes, nombre) do
  #   encabezado =
  #     if File.exists?(nombre) do
  #       ""
  #     else
  #       "nombre, edad, altura\n"
  #     end
  #   clientes
  #   |> generar_mensaje_clientes(&convertir_cliente_linea_csv/1)
  #   |> (&(encabezado <> &1 <> "\n")).()
  #   |> (&File.write(nombre, &1, [:append])).()
  #   clientes
  # end

  # def leer_csv(nombre) do
  #   nombre
  #   |> File.stream!()
  #   |> Stream.drop(1)
  #   |> Enum.map(&convertir_cadena_docente/1)
  # end

  # def generar_mensaje_docente(lista_docentes,parser) do
  #   lista_docentes
  #   |> Enum.map(parser)
  #   |> Enum.join("\n")
  # end

  # def generar_mensaje_clientes(lista_clientes, parser) do
  #   lista_clientes
  #   |>Enum.map(parser)
  #   |>Enum.join("\n")
  # end
end
