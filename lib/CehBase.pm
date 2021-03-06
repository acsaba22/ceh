#!/opt/ceh/lib/perl

package CehBase;

use strict;
use warnings;
use File::Path qw(make_path rmtree);
use Carp;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($CEH_NIX $CEH_NIXPKGS_GITURL $CEH_NIXPKGS_GIT
  $CEH_BASELINE_NIXPKGS done debug touch systemdie path_prepend);

our $CEH_NIX='/nix/store/k0ksg8yjwz026vwivcnkjwfmv4jbkqyl-nix-1.5.1';
our $CEH_NIXPKGS_GITURL='http://github.com/NixOS/nixpkgs';
our $CEH_NIXPKGS_GIT='/nix/var/ceh_nixpkgs';
our $CEH_BASELINE_NIXPKGS='168115f610835654c1ed85a1bcf089f0919c9566';

sub done($) {
    return -f "$_[0].done";
}

sub debug {
    print STDERR @_, "\n";
}

sub touch($) {
    open my $fh, '>', "$_[0]" or croak;
    close $fh or croak;
}

sub systemdie {
    system(@_) == 0 or croak;
}

# Prepends $1 to the front of $2 (which should be a colon separated
# list).  If $1 is already contained in $2, deletes the old occurrence
# first.  $2 defaults to PATH.  No-op if $1 is not a directory.
sub path_prepend {
    use Env::Path;

    my ($new, $what) = @_;
    $what = 'PATH' unless $what;
    return unless -d "$new";
    my $path = Env::Path->$what;
    $path->Remove($new)->Prepend($new);
    $ENV{$what} = $$path;
}

1;
