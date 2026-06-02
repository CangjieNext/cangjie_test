// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to b in .* was an invoke call.
// ASSERT: regex The function call to a in .* was an invoke call.
// ASSERT: regex The function call to test in .* was an apply call.
// ASSERT: regex \[Devirtualization\] The function call to b at \[26,.*\] was optimized.
// ASSERT: regex-not \[Devirtualization\] The function call to a at \[24,.*\] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

private interface interfaceA {
    func b(): Bool {
        return true
    }
}

private open class classA <: interfaceA {
    protected open func a(): Bool {
        return b()
    }
}

private class classB <: classA {}

private class A {
    func test(i: classB) {
        i.a()
    }
}

main() {
    var b = classB()
    var a = A()
    var res = a.test(b)
    if (res == true) {
        return 0
    } else {
        return 1
    }
}
