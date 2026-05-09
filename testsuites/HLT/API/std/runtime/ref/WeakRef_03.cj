/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-1: %compiler %cmp_opt %f -o %output

import std.ref.*

struct Rectangle {
    let width: Int64
    let height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }
    public func area(): Unit  {
        width * height
    }
}

main() {
    let r = Rectangle(10, 20)
    var cache = WeakRef<Rectangle>(r, CleanupPolicy.EAGER)
    return 0
}
