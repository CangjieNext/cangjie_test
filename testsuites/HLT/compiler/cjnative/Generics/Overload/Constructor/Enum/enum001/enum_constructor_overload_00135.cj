/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class D <: A {}

open class G <: D {}

open class B {}

open class E <: B {}

open class H <: E {}

open class C {}

open class F <: C {}

open class I <: F {}

enum X {
    a((A, B, F))
}

enum Y {
    a((D, E, C))
}

main(): Int64 {
    var j = a((G(), H(), I()))
    return 1
}
// ASSERT: scan sema_multiple_constructor_in_enum
