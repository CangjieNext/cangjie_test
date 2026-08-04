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

// (target_ios_simulator)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test2.cj -o my_test2.bc
// (target_ios_simulator)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test1.cj -o my_test1.bc
// (target_ios_simulator)EXEC: %compiler --lto-keep-pkg-visibility="tmp_test" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto-staticlib-format=native --lto=full my_test1.bc my_test2.bc %f -o lib.a 
// (target_ios_simulator)EXEC-1: nm lib.a | grep -E "T.*(foo|fxx)" 
// (target_ios_simulator)EXEC-1: nm lib.a | grep -E "T.*(hw)" 
// (target_ios_simulator)EXEC: nm lib.a | grep -E "T.*(testmain)" 


main(): Int64 {
    hw()
    return 0
}

public func testmain(): Unit {
    fxx()
}