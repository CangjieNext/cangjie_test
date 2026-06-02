// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func pipeline<T1, T2>(x: T1, f: (T1) -> T2): T2 {
    f(x)
}

struct A {
    func f(x: Int32): Float32 {
        Float32(x)
    }
}

main() {
    let x: Int32 = 100
    let a = A()
    let res = pipeline(x, a.f)
    print(res.toString())
    if (res == 100.0) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
