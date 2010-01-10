require 'formula'

class Simh <Formula
  url 'http://simh.trailing-edge.com/sources/simhv38-1.zip'
  version '3.8-1'
  homepage 'http://simh.trailing-edge.com/'
  md5 'e15f65a82e21ea49e14b438326d93d5c'
  
  def install
    ENV['OSTYPE'] = 'darwin'
    system "mkdir BIN"
    inreplace "makefile", "NETWORK_OPT = -DUSE_NETWORK -isystem /usr/local/include /usr/local/lib/libpcap.a", "NETWORK_OPT = -DUSE_NETWORK -lpcap"
    inreplace "makefile", "CC = gcc", "CC = #{ENV.cc} #{ENV['CFLAGS']}"
    system "make USE_NETWORK=1 all"
    bin.install Dir['BIN/*']
  end
end
