// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_test1.*
import my_test2.*

// LEVEL: 1
// DEPENDENCE: my_test1.cj my_test2.cj
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full --output-type=staticlib --lto-staticlib-format=bitcode my_test2.cj -o my_test2.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full --output-type=staticlib --lto-staticlib-format=bitcode my_test1.cj -o my_test1.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="tmp_test,my_test1" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test1.bc my_test2.bc %f --output-type=staticlib --lto-staticlib-format=native -o libtmp_test.a
// (target_ios_simulator)EXEC: nm -m libtmp_test.a | awk '$2 == "(_TEXT,_text)" && $3 == "external" && $4 ~ /testmain/'
// (target_ios_simulator)EXEC: nm -m libtmp_test.a | awk '$2 == "(_TEXT,_text)" && $3 == "external" && $4 ~ /hw/'
// (target_ios_simulator)EXEC: nm -m libtmp_test.a | awk '$2 == "(_TEXT,_text)" && $3 == "private external" && $4 ~ /fxx|foo/'

main(): Int64 {
    hw()
    return 0
}

public func testmain(): Unit {
    fxx()
}