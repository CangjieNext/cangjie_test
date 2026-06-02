/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Rectangle2<T> {
    public let width2: Int32 = 10
    public let length2: Int32 = 10
    public let perimeter2 = {=> 2 * (width2 + length2)}
    public init(side: Int32) {
        this(width2: side, length2: side)
    }
    public init(width2!: Int32, length2!: Int32) {
        this.width2 = width2
        this.length2 = length2
    }
    public init(width2!: Int32, length2!: Int32, perimeter2!: () -> Int32) {
        this.width2 = width2
        this.length2 = length2
        this.perimeter2 = perimeter2
    }
    public func area2(): Int32 {
        width2 * length2
    }
}

main() {
    let newRectangle2_1 = Rectangle2<Int32>(100) // Invoke the custom constructor.
    let newRectangle2_2 = Rectangle2<Int32>(width2: 10, length2: 20) // Invoke another custom constructor.

    //    let newRectangle2_3 = Rectangle2<Int32>(width2:10, length2:20, perimeter2:{2 * width2 + 2 * length2})  // Change the default value of perimeter2.
    return 0
}
// ASSERT: scan sema_illegal_usage_of_member
// ASSERT: scan sema_cannot_assign_to_immutable
