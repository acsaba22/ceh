. /opt/ceh/scripts/common-functions.sh

ceh_init_gcc_env_for_ghc
ceh_path_prepend "/nix/var/nix/profiles/ceh/ghc-libs/lib" LD_LIBRARY_PATH || true
