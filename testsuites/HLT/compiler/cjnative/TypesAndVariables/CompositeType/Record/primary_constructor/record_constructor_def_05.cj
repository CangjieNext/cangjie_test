/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct Test {
    public let a: Int32 = 1
    public var b: Int32 = 2

    public Test(a1: Int32, b1: Int32) {
        a = a1 + 1
        b = b1 + 1
    }
}

let res = Test(2, 4)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 3 && res2 == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_assign_to_immutable
