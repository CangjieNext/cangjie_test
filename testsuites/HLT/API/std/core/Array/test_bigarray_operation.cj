/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not iOS) RUN-EXEC: %export cjHeapSize=1gb && %run %run_opt %output %run_utest_opt %run_args

@Test
class Test_Big_Array_Operation {
    @TestCase
    func test_basic_func() {
        var arr_256MB = Array<Int64>(32 * 1024 * 1024, {x: Int64 => x})
        @Expect(arr_256MB.contains(0))
        @Expect(arr_256MB.contains(32 * 1024 * 1024 - 1))
        @Expect(arr_256MB.contains(32 * 1024 * 1024), false)
        arr_256MB[16 * 1024 * 1024] = -1024
        @Expect(arr_256MB.contains(-1024))

        arr_256MB[0..32 * 1024 * 1024 : 1].fill(-2048)
        @Expect(arr_256MB.contains(-2048))

        for (i in 0..32 * 1024 * 1024) {
            arr_256MB[i] = -i
        }
        @Expect(arr_256MB[16 * 1024 * 1024], -16 * 1024 * 1024)
    }

    @TestCase
    func test_copy() {
        var arr_32MB = Array<Int64>(4 * 1024 * 1024, {x: Int64 => x + 1})
        var arr_32MB_01 = arr_32MB.clone()
        arr_32MB_01.reverse()
        arr_32MB_01.reverse()
        @Expect(arr_32MB, arr_32MB_01.toArray())
        var arr_32MB_02 = Array<Int64>(4 * 1024 * 1024, repeat: 0)
        arr_32MB.copyTo(arr_32MB_02, 0, 0, 4 * 1024 * 1024)
        @Expect(arr_32MB_02, arr_32MB)
        @Expect(arr_32MB_02.slice(0, 4 * 1024 * 1024), arr_32MB)
    }
}
