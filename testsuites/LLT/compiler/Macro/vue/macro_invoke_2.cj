// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  define2.cj
// EXEC: %compiler define2.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 1

import define.*

class X {
    public X(@A(1)) {
        println(a)
    }
}

main() {
    X(1)
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
