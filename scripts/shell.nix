with import <nixpkgs> {};

let common = [
    stdenv
    cmake

    python3
    python3Packages.pytest
]; 
in {
	dev = stdenv.mkDerivation rec {
		name = "hm-env";

		buildInputs = common ++ [
			kdevelop
		];

		shellHook = ''
			# export something
			#nix-store --add-root kdev --indirect -r ${kdevelop}
		'';
	};

	test = stdenv.mkDerivation rec {
		name = "hm-env";
		buildInputs = common;
	};
}


