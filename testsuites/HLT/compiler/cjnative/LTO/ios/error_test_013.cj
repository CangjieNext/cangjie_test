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
// (target_ios_simulator)EXEC-PIPE-1: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test2.cj --lto-staticlib-format=native --output-type=dylib  -o libmy_test2.a 2>&1 | compare %f
// ASSERT: scan iOS LTO only supports --output-type=staticlib

main(): Int64 {
    hw()
    return 0
}