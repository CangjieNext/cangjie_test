// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle %enableO2
// EXEC: %compiler %cmp_opt pkg.%middle %f %enableO2 -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output

import pkg.*

let v = A.r

main() {
    if (A.a != 1) {
        return 1
    }
    if (v.start != A.a || v.end != 5) {
        return 2
    }
    A.a = 8
    A.a == 8
    am.b1 == an.b1
    am.b2 >= an.b2
    return 0
}

// ASSERT: scan-not Replace if node
// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped
