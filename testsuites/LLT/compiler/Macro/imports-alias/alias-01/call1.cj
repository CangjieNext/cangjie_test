// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define1.cj 
// EXEC: %compiler define1.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// positive case
import p1.M1 as M
import p1.N1

@M
class A {}

@N1
class B {}

main() {
    let a1 = @M(1+2)
    let a2 = @N1(1+2)
    if (a1 != 3) {
        return 1;
    }
    if (a1 != 3) {
        return 2;
    }
    0
}
