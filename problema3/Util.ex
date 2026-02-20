defmodule Util do
  @moduledoc """
  Modulo con funciones que se reutilizan
  Autor: Area de programacion
  Fecha: Febrero 2026
  Licencia: GNU GPL v3
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |>IO.puts()
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error,mensaje)
  end

  def ingresar(mensaje,:texto) do
    mensaje
    |>IO.gets()
    |>String.trim()
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |>ingresar(:texto)
      |>String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un numero entero \n"
        |>mostrar_error()

        mensaje
        |>ingresar(:entero)
    end
  end
end
