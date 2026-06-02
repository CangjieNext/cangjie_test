/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan Generic type parameter B is not provided, did you forget to put a @Types macro?

@Test
@Types[A in<Int64>]
func testFoo<A, B>(): Unit {}
