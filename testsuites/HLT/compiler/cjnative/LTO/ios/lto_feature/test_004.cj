// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_iface.*

// LEVEL: 1
// DEPENDENCE: my_iface.cj
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full --output-type=staticlib --lto-staticlib-format=bitcode my_iface.cj -o my_iface.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_iface.bc %f --output-type=dylib -o libtmp_test.dylib
// (target_ios_simulator)EXEC-1: nm libtmp_test.dylib | grep -E "T.*(useGreeter|main)"
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options --experimental --lto=full my_iface.bc %f -o %output
// (target_ios_simulator)EXEC-1: nm %output | grep -E deadIfaceFunc
// (target_ios_simulator)RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var g = EnglishGreeter()
    println(useGreeter(g))
    return 0
}
