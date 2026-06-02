// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define5.cj ../define4.cj
// EXEC: %compiler define5.cj %cmp_macro
// EXEC: %compiler define4.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// positive case
import p4.*
import p5.*

// p5.M
@M4[true]
class A {}
// p4.M
@M4
class B {}

main() {
    let a1 = @M4[true](1+2)
    let a2 = @M4[true](1+3)
    if (a1 != 3) {
        return 1
    }
    if (a2 != 4) {
        return 2
    }
    0
}
