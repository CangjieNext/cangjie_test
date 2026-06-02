// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct R {
    let value: Int64 = 42
    func m(r: Int64): Int64 {
        return value
    }
}

func f(): (Int64) -> Int64 {
    let local = R()
    return local.m
}

main() {
    let a = f()
    let b = 100
    print(b.toString())
    print(a(b).toString())
    if (b == 100 && a(b) == 42) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
