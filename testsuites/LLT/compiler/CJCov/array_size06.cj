// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix

class A {
    var data: Array<Int64> = [1, 2, 3, 4, 5]
    let a: Array<Int64> = [3, 1, 2]
    let b = B()
    func foo(): A {
        var x = A()
        return x
    }
    func getData() {
        return a
    }
    func getB() {
        return b
    }
}

class B {
    var data: Array<Int64> = [1, 2, 3, 4, 5, 6]
    let a: Array<Int64> = [3, 1, 2, 0]
    func foo(): A {
        var x = A()
        return x
    }
    func getData() {
        return a
    }
    func getData(x: Array<Int64>) {
        return x
    }
}

main() {
    let insA = A()
    let insB = B()
    let a = insA.data.size
    let b = insA.getData().size
    let c = insB.foo().data.size
    if (a.toString() == "5" && b == 3 && c == 5) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
