/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test_lex_lambdaExpr_inMacro_define_002.cj
// EXEC: %compiler %cmp_macro test_lex_lambdaExpr_inMacro_define_002.cj
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected '=>' in lambda expression, found '='
import define.*

@M()

main() {
    0
}
