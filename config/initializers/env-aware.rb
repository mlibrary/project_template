# An example of a rails initializer for an environment-aware configuration
# file. This same invocation method can be used outside of rails.
# This particular example puts the values on the Rails.config object, but
# this isn't the only way to do it by far.

Rails.application.configure do
  cfg = config_for(:"env-aware")
  config.local_namespace  = cfg["local_namespace"]
  config.local_api_root   = cfg["local_api_root"]
  config.staging_dir      = cfg["staging_dir"]
  config.repo_dir         = cfg["repo_dir"]
  config.active_job.queue_adapter = cfg["queue_adapter"].to_sym
end
