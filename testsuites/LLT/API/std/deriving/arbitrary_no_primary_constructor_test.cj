/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan Primary constructor is required for Arbitrary deriving
// ASSERT: scan CNoConstructor
// ASSERT: scan SNoConstructor

import std.deriving.*
import std.unittest.prop_test.*
import std.random.Random

@Derive[std.unittest.prop_test.Arbitrary]
class CNoConstructor {}

@Derive[std.unittest.prop_test.Arbitrary]
struct SNoConstructor {}

main() {}
