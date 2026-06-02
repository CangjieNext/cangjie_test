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

class TEST {
    var mem1: CType
    var mem2: CType

    init(mem1: CType, mem2: CType) {
        this.mem1 = mem1
        this.mem2 = mem2
    }

    func test1(mem1: CType, mem2: CType): CType {
        return mem1
    }
}

main() {
    var count = 0

    var a: TEST = TEST(1, 2)
    var num = a.test1(1, 2)

    match (num) {
        case n: Int64 => count += 1
        case _ => ()
    }

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
