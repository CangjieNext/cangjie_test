// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test

// LEVEL: 1
// DEPENDENCE: lib1.cj lib6.cj
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_lib_opt --lto=thin lib6.cj -o lib6.bc
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt %compile_dylib_opt  --lto=full lib1.cj lib6.bc -o %output -V --link-options --no-undefined
// (target_linux | target_android | target_ohos)EXEC: %compiler %cmp_opt  --lto=thin %f -o %output
// (target_linux | target_android | target_ohos)RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return 0
}