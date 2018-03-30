# An example of a rails initializer for a configuration file not tied to the
# various environments. This same invocation method can be used outside of rails.
# This particular example puts the values on the Rails.config object, but
# this isn't the only way to do it by far.
#
# This method is preferable to environment-aware configuration files, despite
# the extra verbosity here.

# We prefer a Pathname over a string here because it helps to catch common
# programmer mistakes.
Rails.application.configure do
  path = Pathname.new(Rails.root)/"config"/"normal.yml"
  config.normal = YAML.load(ERB.new(path.read).result)
end
