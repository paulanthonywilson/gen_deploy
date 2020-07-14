defmodule GenDeploy.FilesAndDirsTest do
  use ExUnit.Case

  alias GenDeploy.FilesAndDirs
  import MixHelper

  test "client path in normal project" do
    in_tmp_project(:bob, fn ->
      assert Path.expand(".") == FilesAndDirs.client_root()
    end)
  end

  test "client path in umbrella project" do
    in_tmp_umbrella_project(:bob_umbrella, fn ->
      assert Path.expand(".") == FilesAndDirs.client_root()
    end)
  end

  test "Terraform source files and templates path" do
    expected_source_path = Path.join(Mix.Project.app_path(), "priv/templates/terraform")

    in_tmp_project(:mavis, fn ->
      assert FilesAndDirs.terraform_source_path() == expected_source_path
      assert File.exists?(Path.join(FilesAndDirs.terraform_source_path(), "main.tf"))
    end)
  end

  test "Terraform destination path" do
    in_tmp_project(:bob, fn ->
      assert FilesAndDirs.terraform_dest_path() == Path.expand("./deploy/terraform")
    end)
  end

  test "Docker build source path" do
    expected_source_path = Path.join(Mix.Project.app_path(), "priv/templates/docker_build")
    in_tmp_project(:rita, fn ->
      assert FilesAndDirs.docker_build_source_path() == expected_source_path
      assert File.exists? Path.join(FilesAndDirs.docker_build_source_path(), "Dockerfile")
    end)
  end

  test "Docker build destination path" do
    in_tmp_project(:bob, fn ->
      assert FilesAndDirs.docker_build_dest_path() == Path.expand("./deploy/docker_build")
    end)
  end
end
