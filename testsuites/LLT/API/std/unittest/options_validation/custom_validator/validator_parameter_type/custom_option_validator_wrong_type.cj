/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f  2>&1 | compare %f
// ASSERT: scan mismatched types
// ASSERT: scan expected 'Struct-String', found 'Interface-Any'

// NOTE: Because of validator callback checks only one concrete type
// only one type should be specified in @UnittestOption.

@UnittestOption[String, Int](opt, { x: String => x.size < 5})

@Test
@Configure[opt: "value"]
func foo() {}
