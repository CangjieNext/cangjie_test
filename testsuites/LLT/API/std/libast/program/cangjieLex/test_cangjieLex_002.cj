// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    var tks = cangjieLex("")
    tks.dump()

    tks = cangjieLex("var a = 1")
    tks.dump()

    tks = cangjieLex("var a = 1", false)
    tks.dump()
}

/* SCAN-IN
description: var, token_id: 92, token_literal_value: var, fileID: 0, line: 1, column: 1
description: identifier, token_id: 137, token_literal_value: a, fileID: 0, line: 1, column: 5
description: assign, token_id: 30, token_literal_value: =, fileID: 0, line: 1, column: 7
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 0, line: 1, column: 9
description: var, token_id: 92, token_literal_value: var, fileID: 0, line: 1, column: 1
description: identifier, token_id: 137, token_literal_value: a, fileID: 0, line: 1, column: 5
description: assign, token_id: 30, token_literal_value: =, fileID: 0, line: 1, column: 7
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 0, line: 1, column: 9
description: end, token_id: 144, token_literal_value: , fileID: 0, line: 1, column: 10
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
