/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.ref.*

class Rectangle {
    let width: Int64
    let height: Int64
    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }
    public func area(): Int64  {
        width * height
    }
}

// Use global strong refs to make lifetime of referents predictable.
var a = Rectangle(10, 20)

main() {
    var cache = WeakRef<Rectangle>(a, CleanupPolicy.DEFERRED)
    var b = match (cache.value) {
        case Some(x) =>
            if (x.area() == 200) {
                0
            } else {
                1
            }
        case None => 1
    }
    return b
}
