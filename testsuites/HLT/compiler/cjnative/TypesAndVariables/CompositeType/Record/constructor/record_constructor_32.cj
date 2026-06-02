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
    public let a: Int32
    public let b: Int32 = 1
    public init(a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }

    public init(x: Int32) {
        a = x
    }
}

let res = Test(5, 6)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

// ASSERT: regex-not no position error occurred
