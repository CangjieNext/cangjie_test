// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to a in .* was an invoke call.
// ASSERT: regex The function call to test in .* was an apply call.
// ASSERT: scan [Devirtualization] The function call to a at [30,9] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

private interface interfaceA {
    func a(): Bool
}

private abstract class ClassB <: interfaceA {}

private class ClassC <: ClassB {
    public func a(): Bool {
        true
    }
}

private class A {
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
