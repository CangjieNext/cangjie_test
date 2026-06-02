/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt p2/a.cj -o p2.%middle
// ERRCHECK: %compiler %cmp_opt %f p1.%middle p2.%middle -o %output

import p1 as f1
import p2 as f1

main(): Int64 {
    return f1.b - f1.a - f1.a
}
// ASSERT: scan package_conflict_import
