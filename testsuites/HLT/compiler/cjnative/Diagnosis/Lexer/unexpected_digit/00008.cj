/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

9o
0p
1q
2r
3s
4t
5u
6v
// ASSERT: scan lex_unknown_suffix
// ASSERT: scan lex_unexpected_exponent_part
// ASSERT: scan lex_illegal_integer_suffix
