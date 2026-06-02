/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args
import std.deriving.*

open class B<T> {
    static const test = 1
}

@Derive[ToString]
enum A {
    T(Int64)
}

main() {
    if (A.T(1).toString() == "A.T(1)") {
        return 0
    }
    return 1
}
