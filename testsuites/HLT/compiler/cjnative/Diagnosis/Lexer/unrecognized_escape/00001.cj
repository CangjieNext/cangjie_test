/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f

'\a'
'\A'
'\1'
'\U'
'\R'
'\F'
'\V'
'\N'
'\T'
'\B'
// ASSERT: scan lex_unrecognized_escape
