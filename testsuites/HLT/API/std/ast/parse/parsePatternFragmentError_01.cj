/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: parsePatternFragmentError_define.cj
// EXEC: %compiler %cmp_macro parsePatternFragmentError_define.cj
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan expected pattern, found keyword 'case'
// ASSERT: scan An exception has occurred:
// ASSERT: scan ParseASTException
// ASSERT: scan parsing pattern fragment error.
// ASSERT: scan macro evaluation has failed for macro call 'M'

internal import std.ast.*
import define.*

@M()

main() {
    0
}
