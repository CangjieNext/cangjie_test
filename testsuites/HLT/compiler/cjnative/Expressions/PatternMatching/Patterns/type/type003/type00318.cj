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
interface A {}

class B <: A {}

func assert(input: A): Int32 {
    return 1
}

func test(): Int64 {
    var i: B = B()
    var res = match (i) {
        case a: A => assert(a)
        case _ => Int32(2)
    }
    if (res == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return test()
}
