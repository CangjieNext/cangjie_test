/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan-2 @UnittestOption macro require types to be specified in [].
// ASSERT: scan IllegalArgumentException: List of types can not be parsed [()].
// ASSERT: scan Exception: Types should be separated with comma [Bool: Int].

@UnittestOption(opt1)

@UnittestOption[](opt2)

@UnittestOption[()](opt3)

@UnittestOption[Bool: Int](opt4)
