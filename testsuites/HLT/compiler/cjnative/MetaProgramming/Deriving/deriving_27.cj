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
@DeriveOrder[b]
class A<T> {
    var a = [1]
    let b: T
    init(temp: T) {
        b = temp
    }
}

main() {
    var a = A<Int64>(2)
    var b = A<Int64>(1)
    if (a < b) {
        return 1
    } else {
        return 0
    }
}
