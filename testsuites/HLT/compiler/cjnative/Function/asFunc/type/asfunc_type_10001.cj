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
    public operator func ()() {}
}

interface B {
    operator func ()() {}
}

class C <: B {}

struct D {
    public operator func ()() {}
}

main() {
    var a: A = A()
    var b: B = C()
    var c: D = D()
    a()
    b()
    c()
    return 0
}
