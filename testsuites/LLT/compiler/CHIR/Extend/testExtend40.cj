// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan-2 extend A

open class A {}

interface I0 {
    func test(): Unit
}

extend A <: I0 {
    public func test(): Unit {
        println("extend A")
    }
}

class B <: A {}

interface I1 {
    func test(): Unit
}

extend B <: I1 {}

main() {
    let a: I0 = B()
    a.test()
    let b: I1 = B()
    b.test()
    if (b is I0) {
        return 0
    }
    return 1
}