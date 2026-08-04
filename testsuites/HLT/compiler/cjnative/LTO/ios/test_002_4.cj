// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_test1.*

// LEVEL: 1
// DEPENDENCE: my_test1.cj my_test2.cj

// (target_ios_simulator)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt  --lto-keep-pkg-visibility="my_test2" --experimental --lto-staticlib-format=native --lto=full my_test2.cj -o lib2.a
// (target_ios_simulator)EXEC: nm lib2.a | grep -E "T.*(foo|fxx)" 


main(): Int64 {
    hw()
    return 0
}