// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to b in .* was an invoke call
// ASSERT: regex The function call to a in .* was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// NOTE: line 11 apply twice since 'func a' was copied to classA and classB

interface interfaceA {
    func a(): Bool {
        return b()
    } //apply
    func b(): Bool
}

class classA <: interfaceA {
    public func b(): Bool {
        return false
    }
}

class classB <: interfaceA {
    public func b(): Bool {
        return true
    }
}

class A {
    public func test(i: interfaceA) {
        i.a() //invoke
    }
}

main() {
    var b = classB()
    var c = classA()
    var a = A()
    var res = a.test(b)
    var res1 = a.test(c)
    if (res == true && res1 == false) {
        return 0
    } else {
        return 1
    }
}
