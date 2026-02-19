defmodule Util do
  def mostrar_mensaje(mensaje) do
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end
  def ingresar_texto(mensaje) do
  mensaje
  |>IO.gets()
  |>String.trim()
end
end
