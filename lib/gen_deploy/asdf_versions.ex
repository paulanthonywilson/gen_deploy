defmodule GenDeploy.AsdfVersions do
  @moduledoc """
  Versions to use in ASDF build for ASDF itself, Elixir (including otp version part), and Erlang.

  Use the Elixir and Erlang versions at compilation. ASDF is hard-coded.
  """
  @asdf "0.7.8"

  @erlang Hex.Utils.otp_version()

  @elixir GenDeploy.AsdfElixirVersionExtracter.extract(System.version(), Hex.Utils.otp_version())

  @spec elixir :: String.t()
  def elixir, do: @elixir

  @spec erlang :: String.t()
  def erlang, do: @erlang

  @spec asdf :: String.t()
  def asdf, do: @asdf
end
