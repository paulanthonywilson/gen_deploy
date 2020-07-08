defmodule GenDeploy.FilesAndDirs do
  @moduledoc """
  Files and directories involved in copying from and to.
  """

  @template_dir Path.join(Mix.Project.app_path(), "priv/templates")

  @spec client_root :: String.t()
  def client_root() do
    Mix.Project.deps_path()
    |> Path.join("..")
    |> Path.expand()
  end

  @spec terraform_source_files :: String.t()
  def terraform_source_files do
    Path.join(@template_dir, "terraform")
  end

  @spec terraform_dest_path :: String.t()
  def terraform_dest_path do
    Path.join(client_root(), "deploy/terraform")
  end

  @spec docker_build_dest_path :: String.t()
  def docker_build_dest_path do
    Path.join(client_root(), "deploy/docker_build")
  end

  @spec docker_build_source_path :: String.t()
  def docker_build_source_path do
    Path.join(@template_dir, "docker_build")
  end

  @spec deploy_root :: String.t()
  def deploy_root do
    Path.join(client_root(), "deploy")
  end

  @spec source_root :: String.t()
  def source_root do
    @template_dir
  end

  def bin_source_path do
    Path.join(@template_dir, "bin")
  end

  def bin_dest_path do
    Path.join(client_root(), "bin")
  end
end
