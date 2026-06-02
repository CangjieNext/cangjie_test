/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct MyRecord {
    public MyRecord(let a: Int32) {}
    public var a0: Int64 = 10
    public var a1: Int32 = 10
    public var a2: Int8 = 10
}

main(): Int64 {
    var a = MyRecord(1)
    var b = MyRecord(2)
    let arr: Array<MyRecord> = [a, b, MyRecord(3)]
    if (arr[0].a0 == 10 && arr[1].a1 == 10 && arr[2].a2 == 10) {
        return 0
    }
    return 1
}
