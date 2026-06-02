/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Data {
    public let width3: Int32 = 1
    public let length3: Int32 = 2
    public var perimeter3: () -> Int32 = {=> 2 * (width3 + length3)}
    public Data(x: Int32, y: Int32, z: () -> Int32) {
    }
}

func run(): Int64 {
    let a: Int32 = 5
    var b: Int32 = 6
    var c: () -> Int32 = {=> a}
    let data = Data(a, b, c)
    let res = data.perimeter3()
    if (res == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_illegal_usage_of_member
