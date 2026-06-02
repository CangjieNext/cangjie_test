/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class TEST <: CType {
    var mem1: Int64
    var mem2: Int64

    init(mem1: Int64, mem2: Int64) {
        this.mem1 = mem1
        this.mem2 = mem2
    }

    func test1(mem1: Int64, mem2: Int64): Int64 {
        return mem1
    }
}

class TEST2 {
    var mem1: Int64
    var mem2: Int64

    init(mem1: Int64, mem2: Int64) {
        this.mem1 = mem1
        this.mem2 = mem2
    }
}

extend TEST2 <: CType {
    func test2(mem1: Int64, mem2: Int64): Int64 {
        return mem2
    }
}

main() {}
// ASSERT: scan sema_cannot_inherit_sealed
// ASSERT: scan sema_interface_is_not_implementable
// ASSERT: scan sema_interface_is_not_extendable
