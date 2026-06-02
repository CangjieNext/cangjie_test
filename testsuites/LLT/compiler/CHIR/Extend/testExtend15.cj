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

open class classA {
    protected open func a(): Bool {
        return true
    }
}

open class classB <: classA {}

class classC <: classB {
    protected override func a(): Bool {
        return false
    }
}

class A {
    func test(i: classB) {
        i.a() //invoke class -> class
    }
}

main() {
    var b = classC()
    var a = A()
    var res = a.test(b)
    if (res == false) {
        return 0
    } else {
        return 1
    }
}