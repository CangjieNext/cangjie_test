/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output  %run_macro_opt %run_args | compare %f
// ASSERT: scan @M[result is ](1)

import test.*

main() {
    var a: Int64 = 1
    print("@M[result is ](${a})") // normal string, not macro call.
    return 0
}
