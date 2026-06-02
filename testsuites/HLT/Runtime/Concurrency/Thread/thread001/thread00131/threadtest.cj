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


class A {
    public var num: Int64 = 1
}

var j: A = A()

main(): Int64 {
    let fut1: Future<A> = spawn {
        j = A()
        j.num = 2
        return j
    }
    sleep(Duration.second);
    if (j.num != 2) {
        return 1
    }
    return 0
}
