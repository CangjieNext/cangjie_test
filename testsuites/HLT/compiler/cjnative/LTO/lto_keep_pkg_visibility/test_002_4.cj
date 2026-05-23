// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import lib1.*

// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj

// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_dylib_opt --lto-keep-pkg-visibility="lib2" --lto=thin lib2.cj -o lib2.so
// (target_linux | target_android | target_ohos)EXEC: nm lib2.so | grep -E "T.*(foo|fxx)" 


main(): Int64 {
    hw()
    return 0
}