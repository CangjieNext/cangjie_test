// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output

import std.ast.*

main() {
    var errCnt = 0

    try {
        parsePattern(quote({))
    } catch (e: ParseASTException) {
        errCnt += 1
    }

    try {
        parsePatternFragment(quote({))
    } catch (e: ParseASTException) {
        errCnt += 1
    }

    try {
        parsePatternFragment(quote(Year(n)), startFrom: 5)
    } catch (e: ParseASTException) {
        errCnt += 1
    }

    if (errCnt == 3) {
        return 0
    }
    return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
