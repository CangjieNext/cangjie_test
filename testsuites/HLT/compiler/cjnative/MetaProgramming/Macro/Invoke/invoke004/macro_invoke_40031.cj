/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %f 2>&1 | compare %f

import test.*

var flag = false

main(){
    @M("
")
    return 0
}
// ASSERT: scan lex_unterminated_single_line_string
