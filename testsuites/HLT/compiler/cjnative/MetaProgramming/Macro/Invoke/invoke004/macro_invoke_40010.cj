/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj
// EXEC: %compiler %cmp_macro test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import test.*

var flag = false

main(){
    @M(_1)
    @M(1a)
    return 0
}
// ASSERT: scan-not lex_expected_letter_after_underscore
// ASSERT: scan lex_unexpected_digit
