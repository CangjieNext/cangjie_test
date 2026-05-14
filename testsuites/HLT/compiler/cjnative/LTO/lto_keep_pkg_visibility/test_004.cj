// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import lib1.*

// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj

// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_lib_opt --lto=thin lib2.cj -o lib2.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler --lto-keep-pkg-visibility="lib1,lib3" %cmp_opt %compile_dylib_opt --lto=full lib1.cj lib2.bc -o lib.so 
// (target_linux | target_android | target_ohos)EXEC-1: nm lib.so | grep -E "T.*(foo|fxx)" 
// (target_linux | target_android | target_ohos)EXEC: nm lib.so | grep -E "T.*(hw)" 
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %f  -L . -l:lib.so -o %output
// (target_linux | target_android | target_ohos)RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    hw()
    return 0
}