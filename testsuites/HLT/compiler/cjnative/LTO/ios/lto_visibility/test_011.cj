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
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full --output-type=staticlib my_test2.cj -o my_test2.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full --output-type=staticlib my_test1.cj -o my_test1.bc
// (target_ios_simulator)EXEC: %compiler %cmp_opt --lto-keep-pkg-visibility="tmp_test" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test1.bc my_test2.bc %f --output-type=dylib -o libtmp_test.dylib
// (target_ios_simulator)EXEC: nm libtmp_test.dylib | grep -E "T.*(testmain)"
// (target_ios_simulator)EXEC-1: nm libtmp_test.dylib | grep -E "T.*(hw)"
// (target_ios_simulator)EXEC-1: nm libtmp_test.dylib | grep -E "T.*(foo|fxx)"

main(): Int64 {
    hw()
    return 0
}

public func testmain(): Unit {
    fxx()
}
