/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_diag_error
import std.deriving.*

@Derive[Comparable]
@DeriveOrder[b, a]
class A {
    static const a: Int64 = 0
    let b: (Int64, Int64)
    init(temp: (Int64, Int64)) {
        b = temp
    }
}

extend A {
    func test() {}
}

main() {
    var a = A((2, 0))
    var b = A((1, 0))
    if (a < b) {
        return 0
    } else {
        return 1
    }
}
