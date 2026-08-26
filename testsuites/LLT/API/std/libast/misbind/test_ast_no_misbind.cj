// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// End-to-end guard for the --exclude-libs fix: a .so using C++ exceptions
// (mimicking harmonyApp's libkn.a) must not bind ast.so via DT_NEEDED.
// With the fix, ast.so exports no C++ symbols, so ld binds libstdc++ instead.
// The Cangjie main() is just a host the framework requires; the real check
// runs via the clang++/readelf EXEC commands below.
// DEPENDENCE: kn_sim.cpp
// EXEC: %clang++ -c -fPIC kn_sim.cpp -o kn_sim.o
// EXEC: %clang++ -shared -fPIC kn_sim.o -L$CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative -lstdc++ -o libkn_sim.so
// EXEC-1: readelf -d libkn_sim.so | grep -i cangjie-std-ast

main(): Int64 {
    return 0
}
