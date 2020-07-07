# Gen Deploy


## Installation

When [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gen_deploy` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gen_deploy, "~> 0.1.0", only: :dev}
  ]
end
```

## What?

Scripts to build a release and deploy that release. It is a somewhat inspired by [ansible-elixir-stack](https://github.com/HashNuke/ansible-elixir-stack) that got a Phoenix app up and running on Digital Ocean, albeit somewhat opaquely. 

First case is deploying to AWS.


### Structure 1 - mininal AWS with load balancer

```
mix dpl.gen aws-lb
```

What you get

* Single AWS instance running the app
* A load balancer

What you don't get

* ssl certificate setup. You need to set this up yourself using AWS 

### Other  cases

Not implemented. I like the idea of:

* An AWS instance with ngnix rather than a load balancer, as a cost-effective option. I do think getting decent ssl support is a must though, and the hard part of this.
* A chunkier version with autoscaling groups across a couple of availabiliy zones and all that jazz



### Todo 

- Copy one thing
- Draw the rest of the owl
