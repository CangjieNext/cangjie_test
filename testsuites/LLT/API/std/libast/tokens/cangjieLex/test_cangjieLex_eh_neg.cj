/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./test_cangjieLex_eh_define.cj
// EXEC: %compiler %cmp_macro ./test_cangjieLex_eh_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -o %output_neg 2>&1 | compare %f
// ASSERT: scan cangjieLex demoted the effect-handler keywords to IDENTIFIER

import eh_lex_define.*

@M
main() {
    0
}
