defmodule GenDeploy.GenerateDockerBuildTest do
  use ExUnit.Case

  alias GenDeploy.GenerateDockerBuild
  import MixHelper

  test "generates the files" do
    in_tmp_project(:sue, fn ->
      GenerateDockerBuild.generate("my_release_name")
      assert_file("deploy/docker_build/Dockerfile")
      assert_file("deploy/docker_build/build_release", "my_release_name")
      assert_file("deploy/release_vars")
      assert_file(".dockerignore", "_build")
    end)
  end
end
