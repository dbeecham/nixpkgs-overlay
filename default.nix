self: super:

{
    awesome = super.awesome.overrideAttrs (old: {
            buildInputs = old.buildInputs ++ [ super.xlibs.xbacklight ];
    });
    st = super.st.override {
            conf = (builtins.readFile ./st.config.h);
            patches = [ ./st/st-scrollback-20170329-149c0d3.diff ];
    };
    mypython = super.python.withPackages (pkgs: with pkgs; [ virtualenv neovim ]);
    mypython3 = super.python36.withPackages (pkgs: with pkgs; [ neovim jedi psutil setproctitle mistune ]);
    and = super.callPackage ./and/default.nix {};
}
