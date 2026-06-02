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
    public var a: Int32
    public var b: Int32 = 1

    public init(a: Int32, b: Int32) {
        this.a = a
        thia.b = b
    }
}

let res = Test(4)
var res1 = res.a
var res2 = res.b

func run(): Int64 {
    if (res1 == 1 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

// ASSERT: regex-not no position error occurred
