/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

1.1a
1.1b
1.1c
1.1d
//1.1e
1.1f
1.1g
1.1h
1.1i
1.1j
1.1k
1.1l
1.1m
1.1n
1.1o
//1.1p
1.1q
1.1r
1.1s
1.1t
1.1u
1.1v
1.1w
1.1x
1.1y
1.1z
// ASSERT: scan lex_unexpected_digit
// ASSERT: scan lex_illegal_float_suffix
// ASSERT: scan lex_unknown_suffix
