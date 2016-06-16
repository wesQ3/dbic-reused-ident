use 5.20.0; use warnings;
use lib 'lib';
use Test::More;
use MyApp::Schema;
my $s = MyApp::Schema->connect($ENV{DBIC_TEST_CONN_STR});

$s->resultset($_)->delete for qw(Artist Cd Track);

my $art = $s->resultset("Artist")->create({ name => 'ZZZ' });
diag 'Artist id: '.$art->id;
my $cd = $art->create_related(cds => { title => 'YYY' });
my $cd_from_db = $s->resultset("Cd")->search({ title => 'YYY' })->next;
diag 'CD id: '.$cd->id;
diag 'Actual CD id: '.$cd_from_db->id;

isnt $cd->id, $art->id, 'created objects id should not come from the previous object';

my $track = $cd->create_related(tracks => { title => 'XXX' }); # FK error

done_testing;
