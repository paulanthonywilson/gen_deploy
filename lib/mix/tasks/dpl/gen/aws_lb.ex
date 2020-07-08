defmodule Mix.Tasks.Dpl.Gen.AwsLb do
  use Mix.Task

  alias GenDeploy.{GenerateAwsWithLb, GenerateDockerBuild}


  @shortdoc "Generates a simple AWS deploy, with a load balancer"
  def run([release_name]) do
    GenerateAwsWithLb.generate(release_name)
    GenerateDockerBuild.generate(release_name)
  end
end
