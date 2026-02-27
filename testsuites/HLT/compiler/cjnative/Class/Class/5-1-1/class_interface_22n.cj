/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f

open class Basec {
    public var one: Int32 = 1
}

open class Basec1 {
    public var two: Int32 = 2
}

interface Basei {
    func getNum() {
        return 1
    }
}

class Data <: Basec & Basec1 & Basei {
    public var resc: Int64 = one
    public var resc1: Int64 = two
    public var resi: Int64 = getNum()
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_illegal_multi_inheritance
// ASSERT: scan sema_illegal_usage_of_super_member
// ASSERT: scan sema_illegal_usage_of_member
