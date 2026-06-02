/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Father {}

class Child <: Father {}

interface I<T> {}

interface J<T> {}

class A <: I<Father> & J<Father> {
    init() {}
}

main() {
    var a: I<Child> = A()
    var b: J<Child> = A()
    return 0
}
// ASSERT: scan sema_mismatched_types
