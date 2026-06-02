/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package packageTest

public func goo() {
    5
}

public func foo(x!: () -> Int64 = goo) {
    return x
}

main(): Int64 {
    if (foo()() == 5) {
        return 0
    } else {
        return 1
    }
}
