/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ThisType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "This"
// ASSERT: scan kind: THISTYPE
// ASSERT: scan pos: 24: 9
// ASSERT: scan }
// ASSERT: scan }

import std.ast.*

main() {
    let tokens = quote(
        This
    )
    let aa = ThisType(tokens)
    aa.dump()
    return 0
}

