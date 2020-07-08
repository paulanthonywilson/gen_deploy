defmodule GenDeploy.AsdfVersionsTest do
  use ExUnit.Case

  test "erlang version" do
    assert GenDeploy.AsdfVersions.erlang() == "23.0"
  end

  test "elixir version" do
    assert GenDeploy.AsdfVersions.elixir() == "1.10.3-otp-23"
  end

  test "asdf version" do
    assert GenDeploy.AsdfVersions.asdf() == "0.7.8"
  end
end
