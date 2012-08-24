# put useful helpers for package and recipe definitions here.

# reads a configuration variable from ENV[name].
# optionally: apply a default value, enforce required or validate regexp.
def config(name, opts={})
  default, required, regexp = opts[:default], opts[:required], opts[:regexp]
  val = ENV[name.to_s] || default
  raise ArgumentError, "expected value for #{name}" unless val || !required
  if regexp && val && !regexp.match?(val)
    raise "value for #{name} [#{val.inspect}] is invalid"
  end
  val
end
