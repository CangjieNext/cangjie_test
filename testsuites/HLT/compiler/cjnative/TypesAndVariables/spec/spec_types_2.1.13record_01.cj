/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Rectangle1 {
    public let width1: Int32 = 10
    public let length1: Int32 = 20
    public let perimeter1: () -> Int32 = {=> 2 * (width1 + length1)}
    public init(width1: Int32, length1: Int32) {
        this.width1 = width1
        this.length1 = length1
    }
    public init(side: Int32) {
        this.width1 = side
        this.length1 = side
    }
    public func area1(): Int32 {
        width1 * length1
    }
}
/*
struct Rectangle2 <T> {
    let width2: T
    let length2: T
    let perimeter2 = { => 2 * (width2 + length2) }
    init (side: T) {
        this(side, side)
    }
    init (width2: T, length2: T) {
        this.width2 = width2
        this.length2 = length2
    }
    func area2(): T { width2 * length2 }
}
 */
main() {
    var t = Rectangle1(2, 4).area1()
    print("${t}")
    return 0
}
// ASSERT: scan sema_illegal_usage_of_member
// ASSERT: scan sema_cannot_assign_to_immutable
