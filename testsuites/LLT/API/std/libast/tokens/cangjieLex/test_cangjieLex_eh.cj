/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./test_cangjieLex_eh_define.cj
// EXEC: %compiler --experimental --enable-eh %cmp_macro ./test_cangjieLex_eh_define.cj
// EXEC: %compiler --experimental --enable-eh %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not cangjieLex demoted
// ASSERT: regex-not does not round-trip

import eh_lex_define.*

@M
main() {
    0
}
