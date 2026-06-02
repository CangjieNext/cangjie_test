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
class A {}

class B {}

func test(): Int64 {
    var i: A = A()
    var res = match (i) {
        case _: B => 0
        case _ => 5
    }
    if (res == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return test()
}
