/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt

@Test
func return_type_is_exact() {
    let e: IllegalArgumentException = @AssertThrows[IllegalArgumentException](throw IllegalArgumentException())
}

@Test
func return_type_can_be_omited() {
    let e = @AssertThrows[IllegalArgumentException](throw IllegalArgumentException())

    @Assert(e is IllegalArgumentException)
}

open class ExceptionP <: Exception {}

class ExceptionA <: ExceptionP {}

class ExceptionB <: ExceptionP {}

@Test
func return_type_is_smallest_common_supertype() {
    let e: ExceptionP = @AssertThrows[ExceptionA | ExceptionB]({
        throw ExceptionA()
    })
}

@Test
func type_of_smallest_common_supertype_can_be_omitted() {
    let e = @AssertThrows[ExceptionA | ExceptionB]({
        throw ExceptionA()
    })

    @Assert(e is ExceptionA)
    @Assert(e is ExceptionP)
}
