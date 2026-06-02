/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f p1.%middle -o %output 2>&1 | compare %f

import p1 as aoo
import aoo as boo

main(): Int64 {
    if (aoo.a != 1) {
        return 1
    }
    if (boo.a != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan package_search_error
