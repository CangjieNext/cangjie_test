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

struct R {
    public var item1: Int64
    public var item2 = 3.14
    public var item3: String = "Hello"
    init(item1!: Int64, item2!: Float64 = 3.14, item3!: String = "Hello") {
        this.item1 = item1
        this.item2 = item2
        this.item3 = item3
    }
}

main() {
    let r1 = R(item1: 1, item2: 1.2, item3: "a")
    let r2 = R(item3: "a", item2: 1.2, item1: 1)
    let r3 = R(item1: 1)
    return 0
}
