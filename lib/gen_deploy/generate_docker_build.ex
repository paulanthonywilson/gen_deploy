defmodule GenDeploy.GenerateDockerBuild do
  @moduledoc """
  Generates the docker build files
  * `deploy/docker_build/Dockerfile`
  * `deploy/docker_build/build_release` run from the docker container to build the release
  * `deploy/docker_build/copy_release`  copies the release from the docker container to the deploy/releases directory
  """

  import GenDeploy.FilesAndDirs,
    only: [
      docker_build_dest_path: 0,
      docker_build_source_path: 0,
      deploy_root: 0,
      source_root: 0,
      client_root: 0
    ]

  import Mix.Generator, only: [create_directory: 1, copy_template: 3, create_file: 2]

  def generate(release_name) do
    create_directory(docker_build_dest_path())
    copy_docker_build_files(release_name)
    copy_release_vars(release_name)
  end

  defp copy_docker_build_files(release_name) do
    for file_name <- File.ls!(docker_build_source_path()) do
      source = Path.join(docker_build_source_path(), file_name)
      dest = Path.join(docker_build_dest_path(), file_name)
      copy_template(source, dest, release_name: release_name)

      if "Dockerfile" != file_name do
        File.chmod!(dest, 0o755)
      end
    end

    create_file(Path.join(client_root(), ".dockerignore"), """
    .git
    _build
    *.dump
    bin
    deploy/terraform
    deploy/release
    deps
    .elixir_ls
    **/priv/static
    **/node_modules
    """)
  end

  defp copy_release_vars(release_name) do
    file_name = "release_vars"
    source = Path.join(source_root(), file_name)
    dest = Path.join(deploy_root(), file_name)
    copy_template(source, dest, release_name: release_name)
  end
end
