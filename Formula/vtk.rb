  url "https://www.vtk.org/files/release/9.2/VTK-9.2.2.tar.gz"
  sha256 "1c5b0a2be71fac96ff4831af69e350f7a0ea3168981f790c000709dcf9121075"
    ENV.llvm_clang if DevelopmentTools.clang_build_version == 1316 && Hardware::CPU.arm?