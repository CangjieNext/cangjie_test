/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1
// ASSERT: scan This is a counter.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.actors.*
import stdx.actors.macros.*

@Actor
public class Counter <: ToString {
    private var cnt: Int64 = 0

    public func toString(): String {
        "This is a counter."
    }
}

main() {
    let counter: Counter = Counter()
    println(counter)
}
