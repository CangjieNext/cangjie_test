/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

class Date {
    private let Date: Int64 = 5
    private let Date1: Int64 = 6
    private let Date2: Int64 = 7

    public func get_pub_Date(): Int64 {
        return Date
    }
    public let pub_modifier: () -> Int64 = get_pub_Date
    private let pri_modifier: () -> Int64 = get_pub_Date
    protected let pro_modifier: () -> Int64 = get_pub_Date

    private func get_pri_Date1(): Int64 {
        return Date1
    }
    public let pub_modifier1: () -> Int64 = get_pri_Date1
    private let pri_modifier1: () -> Int64 = get_pri_Date1
    protected let pro_modifier1: () -> Int64 = get_pri_Date1

    protected func get_pri_Date2(): Int64 {
        return Date2
    }
    public let pub_modifier2: () -> Int64 = get_pri_Date2
    private let pri_modifier2: () -> Int64 = get_pri_Date2
    protected let pro_modifier2: () -> Int64 = get_pri_Date2
}

main(): Int64 {
    var newClass1 = Date()

    //}

    return 0
}
// ASSERT: scan sema_illegal_usage_of_member
