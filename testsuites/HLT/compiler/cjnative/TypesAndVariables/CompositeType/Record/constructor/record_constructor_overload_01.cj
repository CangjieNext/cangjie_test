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
    public let tmp: Int32 = 0
    public init() {
        tmp = 2
    }
    public init(x: Int32) {}
    public init(x: Int32, y: Int32) {}
    public init(x: Int32, y: Float64) {}
}

let res = Test()
let res1 = res.tmp

func run(): Int64 {
    if (res1 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_assign_to_immutable
