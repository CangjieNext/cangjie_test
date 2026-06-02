/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench | compare %f
// ASSERT: scan Summary: TOTAL: 18

/*
 * Test description:
 *      test types combind with @bench
 * Test API:
 *      @Types[]
 */

import std.time.*

@Test
@Types[T in<Int64, Float64, String>]
@Configure[minDuration: Duration.second]
class Test_Types_Bench_01<T> where T <: Hashable {
    @Bench
    @Types[U in<T, Float64, String>]
    func case01<U>(): Unit where U <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<T>().size, Array<U>().size)
    }
}

@Test
@Types[T in<Int64, Float64, String>]
@Configure[minDuration: Duration.second]
class Test_Types_Bench_02<T> where T <: Hashable {
    @Bench
    @Types[U in<Int16, Float64, String>]
    func case01<U>(): Unit where U <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<T>().size, Array<U>().size)
    }
}
