defmodule FinancialFormulas.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "An Elixir library for financial formulas."

  def project do
    [
      app: :financial_formulas,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: @description,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/joeychilson/financial_formulas"},
      maintainers: ["Joey Chilson"]
    ]
  end
end
