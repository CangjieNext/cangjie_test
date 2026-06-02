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

var a: Int16 = 0
var b: UInt16 = 0
var c: Int8 = 0
var d: UInt8 = 0
var e: Float16 = 0.0

enum A {
    | aa(Int64)

    private operator func [](arg1: Int16, arg2: UInt16, arg3: Int8, arg4: UInt8, arg5: Float16): A {
        while (arg1 >= 0) {
            a = (arg1 + 1) * 2
            break
        }
        b = match (arg2) {
            case 2 => arg2 * 2
            case _ => arg2
        }
        c = if (arg3 > 0) {
            arg3 + arg3
        } else {
            arg3 * arg3
        }
        d = (arg4)
        e = {=> arg5}()
        return A.aa(1)
    }
    func foo() {
        A.aa(1)[1, 2, 3, 4, 5.0]
    }
}

main(): Int64 {
    if (A.aa(1).foo() is A && a == 4 && b == 4 && c == 6 && d == 4 && e == 5.0) {
        return 0
    } else {
        return 1
    }
}
