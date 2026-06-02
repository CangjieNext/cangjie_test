// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix

class A {
    public func foo(x: Array<Int64>): Array<Int64> {
        return x
    }
}

func foo(x: Array<Int64>): Array<Int64> {
    return x
}

main() {
    let a: Array<Int64> = [3, 1, 2]
    let b = A().foo(a).size
    if (b.toString() == "3") {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
