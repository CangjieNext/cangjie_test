/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

@Test
class Test_WithRawData_02 {
    @TestCase
    func test_change_array(): Unit {
        var arraybyte = [228u8, 187u8, 147u8, 233u8, 162u8, 137u8, 97u8, 98u8]
        unsafe {
            let str = String.withRawData(arraybyte)
            @Assert(str, "仓颉ab")
            arraybyte[7] = 97u8
            @Assert(str, "仓颉aa")
            arraybyte = Array<Byte>()
            @Assert(str, "仓颉aa")
        }
    }

    @TestCase
    func test_change_string(): Unit {
        var arraybyte = [228u8, 187u8, 147u8, 233u8, 162u8, 137u8, 97u8, 98u8]
        unsafe {
            var str = String.withRawData(arraybyte)
            str = ""
            @Assert(arraybyte, [228u8, 187u8, 147u8, 233u8, 162u8, 137u8, 97u8, 98u8])
        }
    }
}
