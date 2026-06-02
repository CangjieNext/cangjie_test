/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

import std.unittest.common.*

@Test
func late_to_register_validator() {
    let validator = { _: Any => UnknownOptionType }
    // validator should be initialized at static initialization, before unittest fremework runs
    let e = @AssertThrows[UnittestOptionValidationException](registerOptionValidator("option1", validator))
    @PowerAssert(e.toString() == "UnittestOptionValidationException: Validator registry closed. Move your validator on top level.")
}
