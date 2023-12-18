defmodule BurritoExample.MixProject do
  use Mix.Project

  def project() do
    [
      app: :burrito_example,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def application() do
    [
      extra_applications: [:logger],
      mod: {BurritoExample.Application, []}
    ]
  end

  defp deps() do
    [
      {:burrito, "~> 1.0"}
    ]
  end

  def releases() do
    [
      burrito_example: [
        steps: [:assemble, &Burrito.wrap/1],
        burrito: [
          targets: [
            linux_aarch64: [os: :linux, cpu: :aarch64],
            linux_x86_64: [os: :linux, cpu: :x86_64],
            macos_aarch64: [os: :darwin, cpu: :aarch64],
            macos_x86_64: [os: :darwin, cpu: :x86_64],
            windows_x86_64: [os: :windows, cpu: :x86_64]
          ]
        ]
      ]
    ]
  end
end
