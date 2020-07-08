defmodule GenDeploy.GenerateAwsWithLbTest do
  use ExUnit.Case

  alias GenDeploy.GenerateAwsWithLb
  import MixHelper

  test "generating files" do
    in_tmp_project(:ferdinand, fn ->
      GenerateAwsWithLb.generate("ferdinand_release")
      assert_file("deploy/terraform/main.tf")
      assert_file("deploy/terraform/terraform.tfvars", "release_name = \"ferdinand_release\"")
      assert_file("deploy/terraform/.gitignore", "terraform.tfstate")

      assert_file("bin/make-release", "APP=ferdinand_release")
    end)
  end
end
