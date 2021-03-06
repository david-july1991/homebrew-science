class Libbi < Formula
  desc "Bayesian state-space modelling on parallel computer hardware"
  homepage "http://libbi.org"
  revision 2
  head "https://github.com/libbi/LibBi.git"

  stable do
    url "https://github.com/libbi/LibBi/archive/1.3.0.tar.gz"
    sha256 "0dd313dd71e72b2f16ca9074800fc2fa8bf585bec3b87a750ff27e467a9826d0"

    if build.without? "openmp"
      patch do
        # disable OpenMP if it is not used
        url "https://github.com/sbfnk/LibBi/commit/df6fbc815cc4c2c52f9a6bcbffc01bd82f9674fd.diff"
        sha256 "7c0785c5337bcdd8dac9e90e0c37b7766d579684d48abac35974fb5fde67d6b5"
      end
    end
  end
  bottle do
    cellar :any
    rebuild 1
    sha256 "1575efefcacd31858ab5e768dd93653340452324790d24c4da1d239cf4baedfa" => :sierra
    sha256 "e9c819f211182772085b8a687148b6faebb15756448d2681977caa97cf9f033a" => :el_capitan
    sha256 "c8735bf5ee3f56485702a4ec4e89ed4c67e84656f21956c4d4ac020eca220f8b" => :yosemite
    sha256 "3f92ef37f930467dfaa88a241f7f907f79054ab8edaf53110865098d6a39daf0" => :x86_64_linux
  end

  option "without-test", "Disable build-time checking (not recommended)"
  option "without-openmp", "Disable OpenMP"

  needs :openmp if build.with? "openmp"

  depends_on :perl => "5.10"
  depends_on "qrupdate"
  depends_on "netcdf"
  depends_on "gsl"
  depends_on "boost"
  depends_on "automake" => :run

  resource "Test::Simple" do
    url "http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-Simple-1.302075.tar.gz"
    sha256 "86f2205498f96302e00331ac586bf366547e946e8637ad208d6317a2097d40b7"
  end

  resource "Getopt::ArgvFile" do
    url "http://search.cpan.org/CPAN/authors/id/J/JS/JSTENZEL/Getopt-ArgvFile-1.11.tar.gz"
    sha256 "3709aa513ce6fd71d1a55a02e34d2f090017d5350a9bd447005653c9b0835b22"
  end

  resource "Carp::Assert" do
    url "http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Carp-Assert-0.21.tar.gz"
    sha256 "924f8e2b4e3cb3d8b26246b5f9c07cdaa4b8800cef345fa0811d72930d73a54e"
  end

  resource "File::Slurp" do
    url "http://search.cpan.org/CPAN/authors/id/U/UR/URI/File-Slurp-9999.19.tar.gz"
    sha256 "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
  end

  resource "Parse::Yapp" do
    url "http://search.cpan.org/CPAN/authors/id/F/FD/FDESAR/Parse-Yapp-1.05.tar.gz"
    sha256 "228a6cfb483ade811720bb77647900ef359dfc3e071359eb73d39e4a1cc6f22b"
  end

  resource "Parse::Template" do
    url "http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseTemplate-3.08.tar.gz"
    sha256 "3c7734f53999de8351a77cb09631d7a4a0482b6f54bca63d69d5a4eec8686d51"
  end

  resource "Parse::Lex" do
    url "http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseLex-2.21.tar.gz"
    sha256 "f55f0a7d1e2a6b806a47840c81c16d505c5c76765cb156e5f5fd703159a4492d"
  end

  resource "Parse::RecDescent" do
    url "http://search.cpan.org/CPAN/authors/id/J/JT/JTBRAUN/Parse-RecDescent-1.967003.tar.gz"
    sha256 "d4dac8dad012a7eef271a0ac8ec399f9e3b0b53902644df9c208daef8b4b7f0a"
  end

  resource "Math::Symbolic" do
    url "http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Math-Symbolic-0.612.tar.gz"
    sha256 "a9af979956c4c28683c535b5e5da3cde198c0cac2a11b3c9a129da218b3b9c08"
  end

  resource "Class::Inspector" do
    url "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Class-Inspector-1.28.tar.gz"
    sha256 "3ca4b7a3ed1f4cc846c9a3c08f9a6e9ec07a9cbfd92510dea9513db61a923112"
  end

  resource "File::ShareDir" do
    url "http://search.cpan.org/CPAN/authors/id/R/RE/REHSACK/File-ShareDir-1.102.tar.gz"
    sha256 "7c7334b974882587fbd9bc135f6bc04ad197abe99e6f4761953fe9ca88c57411"
  end

  resource "Template" do
    url "http://search.cpan.org/CPAN/authors/id/A/AB/ABW/Template-Toolkit-2.26.tar.gz"
    sha256 "e7e1cf36026f1ef96d8233e18a3fb39e1eafe9109edc639ecf25b20651cd76be"
  end

  resource "Graph" do
    url "http://search.cpan.org/CPAN/authors/id/J/JH/JHI/Graph-0.9704.tar.gz"
    sha256 "325e8eb07be2d09a909e450c13d3a42dcb2a2e96cc3ac780fe4572a0d80b2a25"
  end

  resource "thrust" do
    url "https://github.com/thrust/thrust/releases/download/1.8.2/thrust-1.8.2.zip"
    sha256 "00925daee4d9505b7f33d0ed42ab0de0f9c68c4ffbe2a41e6d04452cdee77b2d"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_create_path "LD_LIBRARY_PATH", Formula["netcdf"].lib
    ENV.prepend_create_path "LD_LIBRARY_PATH", "#{Formula["netcdf"].lib}64" if OS.linux?

    ENV.append "CPPFLAGS", "-I#{include}"
    ENV.append "LDFLAGS", "-L#{Formula["qrupdate"].lib} -L#{Formula["netcdf"].lib}"
    ENV.append "LDFLAGS", "-L#{Formula["netcdf"].lib}64" if OS.linux?

    resources.each do |r|
      r.stage do
        next if r.name == "thrust"
        perl_flags = "TT_ACCEPT=y" if r.name == "Template"
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", perl_flags
        system "make"
        system "make", "test" if build.with? "test"
        system "make", "install"
      end
    end

    resource("thrust").stage do
      (include/"thrust").install Dir["*"]
    end

    system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "LDFLAGS=#{ENV["LDFLAGS"]}"

    system "make"
    system "make", "test" if build.with? "test"
    system "make", "install"

    bin.install libexec/"bin/libbi"
    (libexec/"share/test").install "Test.bi", "test.conf"
    perl_dir = `dirname $(which perl)`
    bin.env_script_all_files(libexec/"bin", :PATH => perl_dir.chomp.concat(":\$PATH"), :PERL5LIB => ENV["PERL5LIB"], :CPPFLAGS => "\$CPPFLAGS -I#{HOMEBREW_PREFIX}/include", :LDFLAGS => "\$LDFLAGS -L#{HOMEBREW_PREFIX}/lib", :CXX => ENV["CXX"])
  end

  def caveats; <<-EOS.undent
    libbi must be run with the same version of perl it was installed with. Changing perl versions might require a reinstall of libbi.
    EOS
  end

  test do
    cp Dir[libexec/"share/test/*"], testpath
    cd testpath do
      system "#{bin}/libbi", "sample", "@test.conf"
    end
  end
end
