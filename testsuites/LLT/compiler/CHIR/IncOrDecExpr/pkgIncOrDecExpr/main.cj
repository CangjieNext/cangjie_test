// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg/pkg.cj
// (not CJNATIVE)EXEC: %compiler %full_bchir %compile_lib_opt pkg.cj
// (not CJNATIVE)EXEC:%interpreter %n.cj 2>&1 | compare %f
// (not not CJNATIVE)EXEC:%compiler pkg.cj %compile_lib_opt -o pkg.%middle
// (not not CJNATIVE)EXEC:%compiler pkg.%middle %n.cj -o %output
// (not not CJNATIVE)EXEC-PIPE-0: %run %output | compare %f
// ASSERT: scan 10
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import pkg.*

main(): Int64 {
    x++
    print(x.toString())
    0
}
