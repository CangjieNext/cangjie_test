// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %cmp_opt 2>&1 | compare %f
// EXEC: %compiler %f -g %cmp_opt 2>&1 | compare %f
// EXEC: %compiler %f -O2 %cmp_opt 2>&1 | compare %f

func g() {
    func f(a: Int64, b!: Int64 = 2) {
        a + b
    }
    f(1)
}

func f(a: Int64, b!: Int64 = 2) {
    a + b
}

main(): Int64 {
    g()
    f(1, b: 2)
    return 0
}

// ASSERT: scan-not warning
