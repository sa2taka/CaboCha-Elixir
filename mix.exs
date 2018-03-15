defmodule CaboCha.MixProject do
  use Mix.Project

  def project do
    [
      app: :cabo_cha,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/sa2taka/CaboCha-Elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "Elixir bindings for CaboCha, a Japanese dependency structure analyzer"
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev},
      {:floki, "~> 0.8"},
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "postgrex",
      # These are the default files included in the package
      files: ~w(lib mix.exs README.md LICENSE),
      maintainers: ~w(sa2taka),
      licenses: ~w(MIT),
      links: %{"GitHub" => "https://github.com/sa2taka/CaboCha-Elixir"}
    ]
  end
end
