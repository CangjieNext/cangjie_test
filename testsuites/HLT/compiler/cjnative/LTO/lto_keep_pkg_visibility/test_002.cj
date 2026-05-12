// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import lib1.*

// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj

// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// (target_linux | target_android | target_ohos)EXEC-1: %compiler --lto-keep-pkg-visibility="lib1,lib3" %cmp_opt --lto=full lib1.cj lib2.bc -o lib.so 


main(): Int64 {
    hw()
    return 0
}