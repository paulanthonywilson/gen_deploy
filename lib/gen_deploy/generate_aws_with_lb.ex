defmodule GenDeploy.GenerateAwsWithLb do
  @moduledoc """
  Generates the terraform and bash scripts for the simplest AWS deploy with a load balancer
  """

  import GenDeploy.FilesAndDirs,
    only: [
      terraform_dest_path: 0,
      terraform_source_path: 0,
      bin_dest_path: 0,
      bin_source_path: 0
    ]

  import Mix.Generator, only: [create_directory: 1, copy_template: 3, create_file: 2]

  def generate(release_name) do
    generate_terraform_files(release_name)
    generate_bin_files(release_name)
  end

  defp generate_bin_files(release_name) do
    create_directory(bin_dest_path())

    for file_name <- File.ls!(bin_source_path()) do
      source = Path.join(bin_source_path(), file_name)
      dest = Path.join(bin_dest_path(), file_name)
      copy_template(source, dest, release_name: release_name)
      File.chmod!(dest, 0o755)
    end
  end

  defp generate_terraform_files(release_name) do
    create_directory(terraform_dest_path())

    for file_name <- File.ls!(terraform_source_path()) do
      source = Path.join(terraform_source_path(), file_name)
      dest = Path.join(terraform_dest_path(), file_name)
      copy_template(source, dest, release_name: release_name)
    end

    create_file(Path.join(terraform_dest_path(), ".gitignore"), """
    terraform.tfvars
    .terraform/
    .terraform.tfstate.lock.info
    terraform.tfstate
    terraform.tfstate.backup
    """)
  end
end
