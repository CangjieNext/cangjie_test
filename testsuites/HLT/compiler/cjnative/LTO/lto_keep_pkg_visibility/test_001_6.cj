// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import lib1.*
import lib2.*
// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj

// (target_linux | target_android | target_ohos)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --lto=thin lib2.cj -o lib2.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --lto=thin lib1.cj -o lib1.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler --lto-keep-pkg-visibility="tmp_test" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_dylib_opt --lto=full lib1.bc lib2.bc %f -o lib.so 
// (target_linux | target_android | target_ohos)EXEC-1: nm lib.so | grep -E "T.*(foo|fxx)" 
// (target_linux | target_android | target_ohos)EXEC-1: nm lib.so | grep -E "T.*(hw)" 
// (target_linux | target_android | target_ohos)EXEC: nm lib.so | grep -E "T.*(testmain)" 


main(): Int64 {
    hw()
    return 0
}

public func testmain(): Unit {
    fxx()
}