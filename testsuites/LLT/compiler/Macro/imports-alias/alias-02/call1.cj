// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define1.cj ../define4.cj
// EXEC: %compiler define1.cj %cmp_macro
// EXEC: %compiler define4.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// positive case
import p1.M1 as M
import p1.N1 as N
import p4.M4 as MM
import p4.N4

@M
class A {}

@N
class B {}

@MM
class C {}

@N4
class D {}

main() {
    let a1 = @MM(1 + 2)
    let a2 = @M(1 + 3)
    if (a1 != 3) {
        return 1
    }
    if (a2 != 4) {
        return 2
    }
    0
}
