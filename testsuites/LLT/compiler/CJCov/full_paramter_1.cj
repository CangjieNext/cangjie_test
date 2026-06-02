// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct R {
    let item1: Int64
    var item2 = 3.14
    var item3: String = "Hello"
    static let item4 = 1000
    public init(item1!: Int64, item2!: Float64 = 3.14, item3!: String = "Hello") {
        this.item1 = item1
        this.item2 = item2
        this.item3 = item3
    }
}

main() {
    let r1 = R(item1: 1, item2: 1.2, item3: "a")
    if (r1.item1 != 1 || r1.item2 != 1.2 || r1.item3 != "a") {
        return 1
    }
    let r2 = R(item3: "a", item2: 1.2, item1: 1)
    if (r2.item1 != 1 || r2.item2 != 1.2 || r2.item3 != "a") {
        return 1
    }
    let r3 = R(item1: 1)
    if (r3.item1 != 1 || r3.item2 != 3.14 || r3.item3 != "Hello") {
        return 1
    }
    return 0
}
