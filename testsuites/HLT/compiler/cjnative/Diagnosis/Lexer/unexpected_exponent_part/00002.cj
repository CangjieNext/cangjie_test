/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

1.1e
0b1e2
0B1p2
0o2p3
0O3e4
// ASSERT: scan lex_expected_digit
// ASSERT: scan lex_unexpected_exponent_part
