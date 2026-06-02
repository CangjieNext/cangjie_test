/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

9Y
0Z
1a
2b
3c
4d
5e
6f
// ASSERT: scan lex_unknown_suffix
// ASSERT: scan lex_unexpected_digit
// ASSERT: scan lex_expected_digit
// ASSERT: scan lex_illegal_float_suffix
