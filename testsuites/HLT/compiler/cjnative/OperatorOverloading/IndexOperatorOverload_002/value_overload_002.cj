/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

var x: UInt64 = 0
var y: Int32 = 0
var z: UInt32 = 0

struct A {
    var a: Int64 = 0
    func foo<T>(a: T) {
        return a
    }

    public operator func [](arg1: UInt64, arg2: Int32, arg3: UInt32): A {
        x = foo<UInt64>(arg1)
        y = match (arg2) {
            case _: Int32 => foo<Int32>(arg2)
            case _ => arg2 * 2
        }
        z = if (arg3 > 0) {
            arg3
        } else {
            0
        }
        return this
    }
}

main(): Int64 {
    if (A()[1, 2, 3] is A && x == 1 && y == 2 && z == 3) {
        return 0
    } else {
        return 1
    }
}
