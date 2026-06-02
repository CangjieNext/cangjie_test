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
// EXEC-PIPE: %compiler %cmp_opt %f p1.%middle -o %output 2>&1 | compare %f

import p1.a as f
import p1.testb as f

main(): Int64 {
    return 1
}
// ASSERT: scan package_conflict_import
