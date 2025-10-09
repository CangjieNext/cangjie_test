/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (CJNATIVE) DEPENDENCE: define.cj
// (CJNATIVE) EXEC: %compiler %cmp_macro define.cj
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.ast.*
import def.*

main() {
    @M1()
}

/* SCAN-IN
description: var, token_id: 92, token_literal_value: var, fileID: 1, line: 18, column: 5
description: identifier, token_id: 137, token_literal_value: x, fileID: 1, line: 18, column: 5
description: assign, token_id: 30, token_literal_value: =, fileID: 1, line: 18, column: 5
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 18, column: 5
 */
