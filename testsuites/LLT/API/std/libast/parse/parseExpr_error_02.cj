// DEPENDENCE: parseExpr_error_define_02.cj
// EXEC: %compiler %cmp_macro parseExpr_error_define_02.cj
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

internal import std.ast.*
import define.*

@M()

main() {
    0
}

// ASSERT: scan expected expression after '+', found '%'
// ASSERT: regex-begin .*\|.*x \+ \% 1
// ASSERT: scan-next ^ expected expression here
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing expr error.
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
