/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt

func throwIAE() {
    throw IllegalArgumentException("some string")
}

@Test
func test_expect_throw() {
    let e_: ?IllegalArgumentException = @ExpectThrows[IllegalArgumentException](throwIAE())
    let e = e_.getOrThrow()
    @Assert(e is IllegalArgumentException)
    @PowerAssert(e.message == "some string")

    let e2: IllegalArgumentException = @AssertThrows[IllegalArgumentException](throw IllegalArgumentException("oke"))
    @PowerAssert(e2.message == "oke")
    @Assert(e2 is IllegalArgumentException)
}
