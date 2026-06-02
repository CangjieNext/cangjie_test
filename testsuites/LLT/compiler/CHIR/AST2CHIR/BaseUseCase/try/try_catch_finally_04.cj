// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

var a = 0

class A {
    func get() {
        a
    }
}

func test(cond: Bool): A {
    var arr = Array<A>(1000, repeat: A())
    for (i in 0..1000) {
        arr[i] = A()
    }
    try {
        if (cond) {
            return A()
        }
        a++
    } finally {
        a++
    }
    return A()
}

main() {
    var v = test(true)
    v = test(false)
    if (v.get() != 3) {
        return 1
    }
    return 0
}
