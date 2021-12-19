# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
# Our Logger general configuration
config :logger,
       backends: [
         :console,
         {LoggerFileBackend, :file_log}
       ],
       level: :debug
#       compile_time_purge_matching: [
#         [level_lower_than: :info]
#       ]


config :logger, :file_log,
       path: "/tmp/KVServer.log",
       level: :debug

#config :logger,
#       backends: [:console, {LoggerFileBackend, :error_log}],
#       format: "[$level] $message\n"
#
#config :logger, :error_log,
#       path: "/tmp/info.log",
#       level: :debug