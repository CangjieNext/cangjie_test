/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

var count = 0

func test() {
    var (c1, c2, f) = (0, 0, 0)
    try {
        try {
            throw A()
        } catch (_: B) {
            c1 = 1
        } finally {
            f = 1
            throw C()
        }
    } catch (_: C) {
        c2 = 1
    }
    if (c1 == 0 && c2 == 1 && f == 1) {
        return 0
    }
    print("c1:${c1}\n")
    print("c2:${c2}\n")
    print("f:${f}\n")
    return 1
}

main() {
    return test()
}
