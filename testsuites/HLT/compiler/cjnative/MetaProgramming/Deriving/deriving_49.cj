/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan parse_diag_error
import std.deriving.*

@Derive[ToString]
open class B<T> {
    var test = 1
}

@Derive[ToString]
enum A {
    T(B<Int64>)
}

main() {
    if (A.T(B<Int64>()).toString() == "A.T(B(test: 1))") {
        return 0
    }
    return 1
}
