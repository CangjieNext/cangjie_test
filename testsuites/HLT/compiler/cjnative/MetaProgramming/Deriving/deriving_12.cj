/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_undeclared_identifier
import std.deriving.*

open class B<T> {}

@Derive[Comparable]
@DeriveOrder[]
class A <: B<Int64> {
    var a = true
}

main() {
    var a = A()
    var b = A()
    if (a < b) {
        return 1
    } else {
        return 0
    }
}
