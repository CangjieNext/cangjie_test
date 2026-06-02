/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

@Test
@Types[U in<Int>]
class Foo {}

@Test
@Types[G in<String, Int64>]
func bar() {
}

/* SCAN-IN
Test framework: macro failed to expand.
@Types macro must be applied to a generic declaration.
 */
