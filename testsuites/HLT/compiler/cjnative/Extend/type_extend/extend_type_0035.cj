/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface A {
    prop a: Int64 {
        get() {
            return 1
        }
    }

    func test(): Int64
}

struct B {}

enum C {
    | TEST
}

class D {}

extend B <: A {
    public func test() {
        return 1 + a
    }
}

extend C <: A {
    public func test() {
        return 2 + a
    }
}

extend D <: A {
    public func test() {
        return 3 + a
    }
}

main() {
    var a = 1
    var res: A = if (a == 0) {
        B()
    } else if (a == 1) {
        C.TEST
    } else {
        D()
    }
    return 3 - res.test()
}
