package MyApp::Schema::Result::Artist;

use warnings;
use strict;

use base qw( DBIx::Class::Core );

__PACKAGE__->table('artist');

__PACKAGE__->add_columns(
  id => {
    data_type => 'int',
    is_auto_increment => 1
  },
  name => {
    data_type => 'varchar',
    size => 250,
  },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_unique_constraint([qw( name )]);

__PACKAGE__->has_many('cds' => 'MyApp::Schema::Result::Cd', 'artistid');

1;

