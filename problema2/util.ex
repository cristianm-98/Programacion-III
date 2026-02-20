defmodule Util do
  @moduledoc """
  Modulo con funciones que se reutilizan
  Autor: Area de programacion
  Fecha: Febrero 2026
  Licencia: GNU GPL v3
  """
  def mostrar_mensaje(mensaje) do
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end
  
  def ingresar_texto(mensaje) do
  mensaje
  |>IO.gets()
  |>String.trim()
end
end
