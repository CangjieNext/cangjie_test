// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_ext.*

// LEVEL: 1
// DEPENDENCE: my_ext.cj
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin --output-type=staticlib --lto-staticlib-format=bitcode my_ext.cj -o my_ext.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="tmp_test,my_ext" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin my_ext.bc %f --output-type=staticlib --lto-staticlib-format=native -o libtmp_test.a
// (target_ios_simulator)EXEC: nm -m libtmp_test.a | awk '$2 == "(_TEXT,_text)" && $3 == "external" && $4 ~ /main|factorial|fibonacci/'
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options --experimental --lto=thin my_ext.bc %f -o %output
// (target_ios_simulator)EXEC-1: nm %output | grep -E deadExtFunc
// (target_ios_simulator)RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    println(factorial(5))
    println(fibonacci(10))
    return 0
}
