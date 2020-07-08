defmodule GenDeploy.AsdfElixirVersionExtracter do
  @moduledoc """
  Takes an Elixir and Erlang version to make an appropriate Asdf elixir version to install
  """

  def extract(elixir_version, erlang_version) do
    "#{elixir_version}-otp-#{erlang_part(erlang_version)}"
  end

  defp erlang_part(erlang_version) do
    %{"major" => major} = Regex.named_captures(~r/^(?<major>\d+)/, erlang_version)
    major
  end

end
