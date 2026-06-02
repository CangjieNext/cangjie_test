// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan toStringabcg\n

var cnt = 0

class A <: ToString {
    public func toString(): String {
        print("toString")
        cnt++
        return "abc"
    }
}

func g(a: String, b!: Bool = false) {
    cnt++
    print(a + "g\n")
}

main() {
    let a = A()
    g(a.toString())
    return cnt - 2
}
