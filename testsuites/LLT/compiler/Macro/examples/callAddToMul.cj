// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroAddToMul.cj
// EXEC: %compiler %cmp_macro macroAddToMul.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan 5pass1
// ASSERT: scan 6pass2

import macro_add_to_mul.*

main(): Int64 {
    var s1 = -1 + 3 + 3
    print(s1.toString() + "pass1\n")
    var s2 = @AddToMul(-1 + 3 + 3)
    print(s2.toString() + "pass2\n") // (-1 + 3) * 3 = 6
    return 0
}
