{ stdenv, fetchurl }:
stdenv.mkDerivation {
        name = "and";
        src = fetchurl {
            url = http://and.sourceforge.net/and-1.2.2.tar.gz;
            sha256 = "d34a09d7a396bcf19beb0002195c5862b62292b04fd1fb5a83ae382955f28118";
        };
        makeFlags = [ "INSTALL_ETC=$(out)/etc" ];
        and_conf = ./and.conf;
        and_priorities = ./and.priorities;
        installPhase = ''
            mkdir -p $out;
            mkdir -p $out/share/man/man5
            mkdir -p $out/share/man/man8
            mkdir -p $out/share/man/man8
            mkdir -p $out/bin/
            mkdir -p $out/etc/
            install -m 0644 $and_conf $out/etc/and.conf
            install -m 0644 $and_priorities $out/etc/and.priorities
            install -m 0644 and.8 $out/share/man/man8/
            install -m 0644 and.conf.5 $out/share/man/man5/
            install -m 0644 and.priorities.5 $out/share/man/man5/
            install -m 0755 and $out/bin/
        '';
}
