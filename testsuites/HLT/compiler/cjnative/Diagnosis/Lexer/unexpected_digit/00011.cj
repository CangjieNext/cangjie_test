/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

3b123
3_b123
0babc
0b2
0b3
0b4
0b5
0b6
0b7
0b8
0b9
0BB
0b_
// ASSERT: scan lex_unexpected_digit
// ASSERT: scan lex_expected_digit
