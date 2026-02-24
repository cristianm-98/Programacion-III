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

  def ingresar(mensaje,:texto) do
    mensaje
    |>IO.gets()
    |>String.trim()
  end
end
