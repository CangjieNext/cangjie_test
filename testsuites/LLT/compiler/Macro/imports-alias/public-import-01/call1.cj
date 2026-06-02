// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pre-define1.cj ./define1.cj
// EXEC: %compiler pre-define1.cj %cmp_macro
// EXEC: %run_macro %compiler define1.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output

import p1.*

// p1.M1
@M1
class A {}
// pre.Pre
@PreMac
class B {}

main() {
    let a1 = @PreMac(1+2)
    if (a1 != 3) {
        return 1
    }
    0
}
