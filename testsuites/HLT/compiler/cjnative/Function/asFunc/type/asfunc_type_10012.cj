/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

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
    A() // init A
    B()
    D() // init D
    return 0
}
// ASSERT: scan sema_interface_can_not_be_instantiated
