// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-4: %run %run_opt %n.%suffix

struct SS {
    var age = 2
}

struct SA {
    var width = 1
    var ss = SS()
    func foo() {
        3
    }
    func foo(x: Bool, y: Bool) {
        if (x) {
            return 3
        } else {
            if (y) {
                var i = 0
                var sum = 0
                while (i != 5) {
                    sum += 1
                    i += 1
                }
                return sum
            }
            return 20
        }
    }
}

var g_1 = 8
let g_2 = g_1 + 1

var (x, y) = (1, 1.0)

main() {
    var a = 9
    var sa = SA()
    var b: Int8 = Int8(a)
    var tu = (1, 2, a)
    a + sa.width + sa.ss.age * sa.foo(false, true) - Int64(b) + g_2 - g_1 * tu[1]
    // i.e., 9+1+2*5-9+9-8*2 = 4
}
