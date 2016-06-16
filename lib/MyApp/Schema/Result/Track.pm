package MyApp::Schema::Result::Track;

use warnings;
use strict;

use base qw( DBIx::Class::Core );

__PACKAGE__->table('track');

__PACKAGE__->add_columns(
  id => {
    data_type => 'int',
    is_auto_increment => 1
  },
  cdid => {
    data_type => 'int',
  },
  title => {
    data_type => 'varchar',
    size => 250,
  },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_unique_constraint([qw( title cdid )]);

__PACKAGE__->belongs_to('cd' => 'MyApp::Schema::Result::Cd', 'cdid');

1;
