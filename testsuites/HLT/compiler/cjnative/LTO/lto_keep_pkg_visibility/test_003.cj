// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import lib1.*

// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj

// (target_linux | target_android | target_ohos)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler --lto-keep-pkg-visibility="lib1,lib3" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_chir_opt --lto=full lib1.cj lib2.bc -o lib.so 
// (target_linux | target_android | target_ohos)ASSERT: scan warning: --lto-keep-pkg-visibility does not take effect under the current configuration


main(): Int64 {
    hw()
    return 0
}