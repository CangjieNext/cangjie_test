// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_test1.*

// LEVEL: 1
// DEPENDENCE: my_test1.cj my_test2.cj
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin -j 4 --output-type=staticlib --lto-staticlib-format=bitcode my_test2.cj -o my_test2.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="my_test1,my_test2" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=thin -j 4  my_test1.cj my_test2.bc --output-type=staticlib --lto-staticlib-format=native -o libmy_test1.a
// (target_ios_simulator)EXEC: nm -m libmy_test1.a | awk '$2 == "(_TEXT,_text)" && $3 == "external" && $4 ~ /hw/'
// (target_ios_simulator)EXEC: nm -m libmy_test1.a | awk '$2 == "(_TEXT,_text)" && $3 == "external" && $4 ~ /foo|fxx/'
// (target_ios_simulator)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %f libmy_test1.a  -o %output
// (target_ios_simulator)RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    hw()
    return 0
}