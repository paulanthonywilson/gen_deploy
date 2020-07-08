defmodule GenDeploy.AsdfElixirVersionExtracterTest do
  use ExUnit.Case

  alias GenDeploy.AsdfElixirVersionExtracter


  test "extracting" do
    assert AsdfElixirVersionExtracter.extract("1.10.4", "23.0") == "1.10.4-otp-23"
  end
end
