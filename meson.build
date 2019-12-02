project('utc-wingpanel', 'vala', 'c')

gettext_name = meson.project_name() + '-indicator'
gnome = import('gnome')
i18n = import('i18n')

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')
add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format(gettext_name), language:'c')

wingpanel_dep = dependency('wingpanel-2.0')

shared_module(
    meson.project_name(),
    'main.vala',
    'DisplayWidget.vala',
    'PopoverWidget.vala',
    link_args : ['-lm', '-nostartfiles'],
    name_prefix: '',
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('granite'),
        dependency('gtk+-3.0'),
        dependency('libgtop-2.0'),
        wingpanel_dep
    ],
    vala_args: [
            '--vapidir=' + meson.source_root() + '/vapi/',
          ],
    install: true,
    install_dir: wingpanel_dep.get_pkgconfig_variable('indicatorsdir')
)
