/*
 * Copyright (c) 2026 Huawei Technologies Co., Ltd. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./test_cangjieLex_eh_define.cj
// EXEC: %compiler %enableEH %cmp_macro ./test_cangjieLex_eh_define.cj
// EXEC: %compiler %enableEH %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not cangjieLex demoted
// ASSERT: regex-not does not round-trip
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -o %output_neg 2>&1 | compare %f
// ASSERT: scan cangjieLex demoted the effect-handler keywords to IDENTIFIER

import eh_lex_define.*

@M
main() {
    0
}
