package Packages::TWS;

use strict;
use warnings;
use CehBase;
use CehInstall;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($ceh_nix_install_root);

$ENV{NIXPKGS_CONFIG}='/opt/ceh/lib/Packages/TWS.nix';
ceh_nixpkgs_install("tws", nixpkgs_version => 'd82d86eb64b159cc821261ec31c528cf97a68382', derivation => '6dbybcm2z61agplngkiwjh7h46k42i06-tws-937.drv', out => '1x66cgmmd5fbvfy9kx19dkgkxis9fc83-tws-937');

1;