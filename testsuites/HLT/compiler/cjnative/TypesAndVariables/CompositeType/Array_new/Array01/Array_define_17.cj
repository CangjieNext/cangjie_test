/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum Foo {
    A | B | C

    public func f1(): Array<Int64> {
        return [1, 2, 3]
    }
    public static func f2(): Bool {
        var a1: Array<Bool> = [false, true]
        if (a1[0]) {
            return a1[0]
        } else {
            return a1[1]
        }
    }
}

main(): Int64 {
    if (Foo.f2()) {
        var d = Foo.A.f1()
        return d[0] + d[1] - d[2]
    }

    return 1
}
