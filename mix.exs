defmodule ColorHash.MixProject do
  use Mix.Project

  @name "ColorHash"
  @version "0.1.1"

  def project do
    [
      name: @name,
      description: "Generate color based on the given string",
      app: :color_hash,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      docs: docs(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      name: :color_hash,
      files: ["lib", "mix.exs", "README*"],
      licenses: ["MIT"],
      links: %{}
    ]
  end

  defp docs do
    [main: "readme", extras: ["README.md"]]
  end
end
