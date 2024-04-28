project(
  'glad',
  'c',
)

r = run_command(
  './utility/generate.sh',
  '--out-path=./build',
  '--api=' + get_option('api'),
  '--extensions=' + get_option('extensions'),
  get_option('reproducible') ? '--reproducible' : '',
  check: false,
)
if r.returncode() != 0
  error(r.stderr().strip())
endif

include = include_directories('./build/include')
sources = files('./build/src/gl.c')
glad = library(
  'glad',
  sources,
  include_directories: include,
)
glad_dep = declare_dependency(
  link_with: glad,
  include_directories: include,
)
