/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC-PIPE: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

// NOTE: This test check that option can be prefixed with public modifier.

public class A {}

@UnittestOption[A](public opt)

@Test
@Configure[opt: A()]
func foo() {}
