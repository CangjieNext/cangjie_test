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

class A {
    var b = 0
    var d = 0
    var f = 1
}

main() {
    var (a, c, e) = (A(), A(), A())
    a.b..c.d : e.f

    a.b..=c.d : e.f
    return 0
}
