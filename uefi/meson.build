project('main', 'cpp',
  default_options: [
    'prefix=' + meson.source_root() / 'packaged',
    'buildtype=debugoptimized',
    'warning_level=3',
    #'werror=true',
    #'cpp_std=c++20',
  ]
)

gnu_efi = declare_dependency(
  include_directories: ['gnu-efi/inc'],
)

add_project_arguments(
  '-Wno-unused-parameter',
  '-Wno-strict-prototypes',
  language: 'cpp',
)

executable(
  'main',
  'main.cc',
  dependencies: gnu_efi,
  install: true,
)
