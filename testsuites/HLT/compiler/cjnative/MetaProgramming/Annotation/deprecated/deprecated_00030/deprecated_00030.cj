/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define_00030.cj
// EXEC: %compiler %cmp_macro define_00030.cj
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan macro_is_deprecated_warning

package deprecated_00030

import define_00030.*

var flag = false

main() {
    @M(flag = true)
    if (flag) {
        return 0
    } else {
        return 1
    }
}
