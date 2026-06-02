/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct TEST1<T> where T <: CType {
    var mem1: T
    var mem2: T

    init(mem1: T, mem2: T) {
        this.mem1 = mem1
        this.mem2 = mem2
    }

    func test1(mem1: T, mem2: T): T {
        return mem1
    }
}

main() {
    var count = 0

    var a1 = TEST1<Int64>(1, 2)
    var num1 = a1.test1(1, 2)

    if (num1 == 1) {
        count += 1
    }

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
