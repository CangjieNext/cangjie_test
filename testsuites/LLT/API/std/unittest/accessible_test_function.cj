/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_args

import std.unittest.*
import std.unittest.testmacro.*

@Test
func example(): Unit {
}

main() {
    example()
}