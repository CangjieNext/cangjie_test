// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to a in .* was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface interfaceA {
    func a(): Bool
}

abstract class ClassB <: interfaceA {}

class ClassC <: ClassB {
    public func a(): Bool {
        true
    }
}

class A {
    public func test(i: interfaceA) {
        i.a()
    }
}

main() {
    var c = ClassC()
    var a = A()
    var res = a.test(c)
    if (res == true) {
        return 0
    } else {
        return 1
    }
}
