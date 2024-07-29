{ lib, fetchFromGitHub, jre, makeWrapper, maven }:

maven.buildMavenPackage rec {
  pname = "JSignPdf";
  version = "2_2_2";

  src = fetchFromGitHub {
    owner = "intoolswetrust";
    repo = pname;
    rev = "refs/tags/${pname}_${version}";
    hash = "sha256-JUKPFemfdysRz/cWkX6Yr8SLuFCZwkd/IPcY1QcqTeo=";
  };

  mvnHash = "sha256-5f13//+ybJEhZDPY/yluncxM7+ruOwPhx7a+T+Tn/04=";

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin $out/share/jsignpdf

    install -Dm644 jsignpdf/target/jsignpdf-2.2.2.jar $out/share/jsignpdf

    #echo "list of current directory"
    #ls -l
    #cp -r jsignpdf/target/jsignpdf-2.2.2.jar $out/bin/jsignpdf-2.2.2.jar
    echo "finished with build"

    makeWrapper ${jre}/bin/java $out/bin/jsignpdf \
      --add-flags "-jar $out/share/jsignpdf/jsignpdf.jar"
    '';

  meta = {
    description = "JSignPdf is a Java application which adds digital signatures to PDF documents. The application uses the OpenPDF library for PDF manipulations.";
    homepage = "https://github.com/intoolswetrust/jsignpdf";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ mrupnikm ];
  };
}
