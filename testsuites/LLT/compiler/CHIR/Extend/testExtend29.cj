// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to b in .* was an apply call
// ASSERT: regex The function call to a in .* was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface interfaceA {
    func b(): Bool {
        return true
    }
}

open class classA <: interfaceA {
    public open func a(): Bool {
        return b()
    } // apply
    public func b(): Bool {
        return false
    }
}

class classB <: classA {}

class A {
    public func test(i: classB) {
        i.a()
    }
}

main() {
    var b = classB()
    var a = A()
    var res = a.test(b)
    if (res == false) {
        return 0
    } else {
        return 1
    }
}
