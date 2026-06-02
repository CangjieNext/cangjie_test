// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct A {
    public static let a: Int64 = c()
    public static func b() {
        return a
    }
    public static func c() {
        return 100
    }
}

func run(): Int64 {
    if (A.a == 100 && A.b() == 100 && A.c() == 100) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
