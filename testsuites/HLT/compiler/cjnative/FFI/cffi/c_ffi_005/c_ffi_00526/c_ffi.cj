/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

@C
struct TEST {
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

main() {}
// ASSERT: scan sema_illegal_member_of_cstruct
