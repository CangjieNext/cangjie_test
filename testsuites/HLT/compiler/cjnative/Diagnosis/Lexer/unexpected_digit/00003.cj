/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

1A
2B
3C
4D
5E
6F
7G
8H
// ASSERT: scan lex_unexpected_digit
// ASSERT: scan lex_expected_digit
// ASSERT: scan lex_unknown_suffix
