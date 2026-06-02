/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_ambiguous_match
import std.deriving.*

open class B<T> {
    func toString() {
    }
}

@Derive[ToString]
class A <: B<Int64> {
    let a: Int64
    init(temp: Int64) {
        a = temp
    }
}

main() {
    if (A(1).toString() == "A(a: 1)") {
        return 0
    }
    return 1
}
