/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

internal import std.unittest.*
internal import std.random.*
internal import std.unittest.prop_test.Arbitrary

main() {
    let random = Random(42)
    let stringGen = String.arbitrary(random)
    let _: String = stringGen.next()
}
