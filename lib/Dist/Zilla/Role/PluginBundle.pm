package Dist::Zilla::Role::PluginBundle;
# ABSTRACT: something that bundles a bunch of plugins
use Moose::Role;
use MooseX::Types;

=head1 DESCRIPTION

When loading configuration, if the config reader encounters a PluginBundle, it
will replace its place in the plugin list with the result of calling its
C<bundle_config> method, which will be passed a Config::MVP::Section to
configure the bundle.

=cut

=attr assembler

This attribute contains the L<Dist::Zilla::MVP::Assembler> object.

=cut

has assembler => (
  is  => 'ro',
  isa => class_type('Dist::Zilla::MVP::Assembler'),
  required => 1,
  weak_ref => 1,
);

sub register_component {
  my ($class, $name, $arg, $self) = @_;
  # ... we should register a placeholder so MetaConfig can tell us about the
  # pluginbundle that was loaded
}

requires 'bundle_config';

no Moose::Role;
1;
