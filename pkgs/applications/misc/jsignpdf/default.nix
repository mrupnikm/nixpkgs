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

  #mvnHash = "sha256-kLpjMj05uC94/5vGMwMlFzLKNFOKeyNvq/vmB6pHTAo=";

  nativeBuildInputs = [ makeWrapper ];

  meta = {
    description = "JSignPdf is a Java application which adds digital signatures to PDF documents. The application uses the OpenPDF library for PDF manipulations.";
    homepage = "https://github.com/intoolswetrust/jsignpdf";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ mrupnikm ];
  };
}
