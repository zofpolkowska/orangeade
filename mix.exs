defmodule Orangeade.MixProject do
  use Mix.Project

  def project do
    [
      app: :orangeade,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Orangeade, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:caffeine, "~> 1.2"},
      {:stream_data, "~> 0.4"},
      {:psi, git: "https://github.com/Dzol/psi", ref: "249bb49bea3b03dce8f70b0815e716e0f5015741"}
    ]
  end
end
