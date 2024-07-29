{ lib, fetchFromGitHub, jre, makeWrapper, maven }:

maven.buildMavenPackage rec {
  pname = "jsignpdf";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "intoolswetrust";
    repo = pname;
    rev = "${pname}-${version}";
    #hash = "sha256-f467d42fa2fdd269e08e9f77fb3406ee167ef1548d9f4a0078f6401ee08e7224";
  };

  #mvnHash = "sha256-kLpjMj05uC94/5vGMwMlFzLKNFOKeyNvq/vmB6pHTAo=";

  nativeBuildInputs = [ makeWrapper ];

  meta = {
    description = "JSignPdf is a Java application which adds digital signatures to PDF documents. The application uses the OpenPDF library for PDF manipulations.";
    homepage = "https://github.com/intoolswetrust/jsignpdf";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ mrupnikm ];
  };
