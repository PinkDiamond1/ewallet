defmodule AdminAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :admin_api,
      version: "1.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      elixirc_options: [warnings_as_errors: Mix.env != :test],
      compilers: [:phoenix] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {AdminAPI.Application, []},
      extra_applications: [:sentry, :logger, :runtime_tools, :appsignal]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.0"},
      {:plug_cowboy, "~> 1.0"},
      {:cors_plug, "~> 1.5"},
      {:sentry, "~> 6.4"},
      {:bodyguard, "~> 2.2"},
      {:deferred_config, "~> 0.1.0"},
      {:appsignal, "~> 1.0"},
      {:bypass, "~> 1.0.0", only: [:test]},
      {:ewallet_config, in_umbrella: true},
      {:ewallet_db, in_umbrella: true},
      {:ewallet, in_umbrella: true}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    []
  end
end
