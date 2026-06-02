// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE: %compiler %cmp_opt %debugCHIROpt %f -o %output 2>&1 | compare %f
// ASSERT: scan The mut var in the line:20 and the column:5 was boxed
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

var a = true

class A {
    var x = 1
}

func foo() {
    var obj = A()

    func goo(): Unit {
        if (a) {
            obj = A()
            obj.x = 10
        } else {
            println("fake recursion")
            goo()
        }
    }
    goo()

    println(obj.x)
    0
}

main() { 
    foo() 
}