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

struct Date {
    public var pub_modifier: Int64 = 1
    private var pri_modifier: Int64 = 2

    public var pub_date1: Int64 = pub_modifier
    public var pub_date2: Int64 = pri_modifier

    private var pri_date1: Int64 = pub_modifier
    private var pri_date2: Int64 = pri_modifier
    public init(pub_modifier!: Int64 = 1, pri_modifier!: Int64 = 2, pub_date1!: Int64 = pub_modifier,
        pub_date2!: Int64 = pri_modifier, pri_date1!: Int64 = pub_modifier, pri_date2!: Int64 = pri_modifier) {
        this.pub_modifier = pub_modifier
        this.pri_modifier = pri_modifier
        this.pub_date1 = pub_date1
        this.pub_date2 = pub_date2
        this.pri_date1 = pri_date1
        this.pri_date2 = pri_date2
    }
}

main(): Int64 {
    var newRec1 = Date()

    if (newRec1.pub_date1 != 1 || newRec1.pub_date2 != 2) {
        return 1
    }
    //print(newRec1.pub_date1.toString() + "\n")
    //print(newRec1.pub_date2.toString() + "\n")

    return 0
}
