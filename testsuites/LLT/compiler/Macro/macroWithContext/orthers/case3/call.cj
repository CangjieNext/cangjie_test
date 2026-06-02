// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 1

import mcr.*

@outer(@inner(var a = 1))

main() {
    var a = 2
    var b = a + 1
    print(b)
}
