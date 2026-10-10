// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_algo.*

// LEVEL: 1
// DEPENDENCE: my_algo.cj
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full --output-type=staticlib --lto-staticlib-format=bitcode my_algo.cj -o my_algo.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="tmp_test,my_algo" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_algo.bc %f --output-type=dylib -o libtmp_test.dylib
// (target_ios_simulator)EXEC: nm libtmp_test.dylib | grep -E "T.*(main|maxOf|buildString)"
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options --experimental --lto=full my_algo.bc %f -o %output
// (target_ios_simulator)EXEC-1: nm %output | grep -E deadAlgoFunc
// (target_ios_simulator)RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    println(maxOf(10, 20))
    println(buildString())
    return 0
}