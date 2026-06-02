/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A,B
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt  ./B/B.cj 
// ASSERT: scan parse_illegal_modifier_in_scope

import B.*
import A.*

main() {
    return a
}
