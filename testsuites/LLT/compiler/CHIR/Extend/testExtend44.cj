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
// ASSERT: regex-not [Devirtualization] The function call to a at [33,.*] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class classA {
    protected open func a(): Bool {
        return b()
    } // invoke open
    protected open func b(): Bool {
        return true
    }
}

class classB <: classA {
    protected override func b(): Bool {
        return false
    } // see testExtend27.cj
}

class A {
    func test(i: classB) {
        i.a() // optimized to apply
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
