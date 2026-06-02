// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 79

var a = true

class A {
    var x = 1
}

class B {
    var y = 2
}

func foo() {
    var obj1 = A()
    var obj2 = B()

    func goo(): Unit {
        if (a) {
            obj1.x = 7
            obj2 = B()
            obj2.y = 9
        } else {
            println("fake recursion")
            goo()
        }
    }
    goo()

    print(obj1.x)
    print(obj2.y)
}

func hoo() {
    var arr = [[1, 2], [3, 4]]

    func goo(): Unit {
        if (a) {
            arr = [[0, 0], [9, 9]]
        } else {
            println("fake recursion")
            goo()
        }
    }
    goo()

    print(arr[1][0])
}

main() {
    foo()
    hoo()
    0
}