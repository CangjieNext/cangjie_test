/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct Test {
    public let a: Array<Int32>
    public init(x: Array<Int32>) {
        a = x
    }
}

let res = Test({1,3})
let res1 = res.a

func run(): Int64 {
    if (res1[0] == 1 && res1[1] == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}