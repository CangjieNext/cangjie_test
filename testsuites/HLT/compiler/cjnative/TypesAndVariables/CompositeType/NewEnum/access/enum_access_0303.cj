/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/c.cj -o c.%middle
// EXEC: %compiler %cmp_opt %f c.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import e1.*

enum E {
    e1

    func f() {}
    func test(): Unit {
        e1.f()
    }
}

main() {
    return 0
}
