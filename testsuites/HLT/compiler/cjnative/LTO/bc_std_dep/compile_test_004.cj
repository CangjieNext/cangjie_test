// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test

// LEVEL: 1
// DEPENDENCE: lib1.cj lib2.cj lib3.cj lib5.cj
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib2.cj -o lib2.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib3.cj -o lib3.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_lib_opt --lto=full lib5.cj -o lib5.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_dylib_opt  --lto=full lib1.cj lib2.bc lib3.bc lib5.bc -o %output -V --link-options --no-undefined -V
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt  --lto=full %f -o %output
// (target_linux | target_android | target_ohos)RUN-EXEC: %run %run_opt %output %run_args
main(): Int64 {
    return 0
}