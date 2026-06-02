// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.ast.*
import def.*

main() {
    @M0(var a = 1)
}

/* SCAN-IN
description: var, token_id: 92, token_literal_value: var, fileID: 1, line: 9, column: 9
description: identifier, token_id: 137, token_literal_value: a, fileID: 1, line: 9, column: 13
description: assign, token_id: 30, token_literal_value: =, fileID: 1, line: 9, column: 15
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 9, column: 17
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
