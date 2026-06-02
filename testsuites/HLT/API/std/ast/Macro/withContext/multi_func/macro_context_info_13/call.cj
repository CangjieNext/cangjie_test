/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: define.cj
// EXEC: %compiler define.cj %cmp_macro 
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

func test1() {
    return 0
}

main(): Int64 {
    @Outer1
    @Inner(var b = 1)
    return b - 1
}
// ASSERT: scan macro_assert_parent_context_failed
