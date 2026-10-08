// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_test1.*
import my_test3.*

// LEVEL: 1
// DEPENDENCE: my_test1.cj my_test2.cj my_test3.cj
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin --output-type=staticlib --lto-staticlib-format=bitcode my_test2.cj -o my_test2.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin --output-type=staticlib --lto-staticlib-format=bitcode my_test3.cj -o my_test3.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="my_test1" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin my_test1.cj my_test2.bc --output-type=dylib -o libmy_test1.dylib
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="my_test3" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin my_test3.cj --output-type=dylib -o libmy_test3.dylib
// (target_ios_simulator)EXEC-1: nm libmy_test1.dylib | grep -E "T.*(foo|fxx)"
// (target_ios_simulator)EXEC: nm libmy_test1.dylib | grep -E "T.*(hw)"
// (target_ios_simulator)EXEC: nm libmy_test3.dylib | grep -E "T.*(f3xx|f3oo)"
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %f -L. -lmy_test1 -lmy_test3 -o %output
// (target_ios_simulator)RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    hw()
    f3xx()
    return 0
}