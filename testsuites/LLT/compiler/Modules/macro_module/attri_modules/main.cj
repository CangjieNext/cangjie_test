// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: src
// (CJNATIVE) EXEC: %compiler %pkg_opt src/pkg1 %cmp_macro
// (CJNATIVE) EXEC: %compiler %pkg_opt src/pkg2 %cmp_macro
// (CJNATIVE) EXEC: %compiler  src/main.cj -o  %output
// (CJNATIVE) EXEC: %run %run_opt %output %run_args

main(): Int64 {
    print("3")
    return 0
}
