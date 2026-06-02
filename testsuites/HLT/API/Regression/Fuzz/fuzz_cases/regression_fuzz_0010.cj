/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output 



macro package test

import std.a{
    return a
}ro ;(a:Tokens, b:Tokens):Tokens{
    return a
}7
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_decl
