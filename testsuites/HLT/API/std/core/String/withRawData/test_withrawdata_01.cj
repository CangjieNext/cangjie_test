/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

@Test
class Test_WithRawData_01 {
    @TestCase
    func test_array_contents(): Unit {
        unsafe {
            @Assert(String.withRawData(Array<Byte>()), "")
            @Assert(String.withRawData([228u8, 187u8, 147u8, 233u8, 162u8, 137u8]), "仓颉")
            @Assert(String.withRawData([97u8, 98u8, 99u8, 100u8]), "abcd")
            @Assert(String.withRawData([226u8, 152u8, 186u8]), "☺")
        }
    }

    @TestCase
    func test_array_unutf8_contents(): Unit {
        unsafe {
            String.withRawData([226u8, 255u8])
        }
    }

    @TestCase
    func test_long_array(): Unit {
        unsafe {
            let arraybyte: Array<UInt8> = collectArray<UInt8>(
                [232, 191, 153, 230, 152, 175, 228, 184, 128, 230, 174, 181, 233, 154, 143, 230, 156, 186, 231, 154, 132,
                    229, 173, 151, 231, 172, 166, 228, 184, 178, 231, 148, 168, 228, 186, 142, 229, 138, 159, 232, 131,
                    189, 230, 181, 139, 232, 175, 149, 239, 188, 154, 97, 98, 99, 106, 107, 115, 98, 97, 104, 97, 100,
                    108, 102, 104, 97, 106, 120, 10, 98, 99, 100, 115, 98, 99, 106, 97, 98, 99, 98, 119, 106, 99, 98,
                    106, 66, 228, 187, 147, 110, 120, 119, 106, 104, 99, 98, 119, 106, 99, 112, 97, 112, 112, 108, 101,
                    97, 106, 99, 110, 107, 99, 110, 106, 107, 74, 110, 97, 99, 106, 110, 107, 99, 110, 115, 107, 107, 97,
                    106, 99, 110, 100, 107, 106, 97, 99, 110, 100, 115, 110, 99, 106, 107, 97, 110, 99, 60, 62, 100, 99,
                    104, 106, 101, 100, 99, 110, 84, 42, 54, 51, 55, 50, 33, 35, 37, 38, 37, 94, 35, 36, 40, 38, 94, 36,
                    94, 42, 64, 37, 37, 42, 94, 41, 38, 40, 42, 37, 38, 42, 42, 41, 38, 42, 37, 94, 38, 36, 38, 40, 42,
                    94, 37, 38, 42, 41] |> map {i: Int64 => UInt8(i)})
            @Assert(String.withRawData(arraybyte) , "这是一段随机的字符串用于功能测试：abcjksbahadlfhajx\nbcdsbcjabcbwjcbjB仓nxwjhcbwjcpappleajcnkcnjkJnacjnkcnskkajcndkjacndsncjkanc<>dchjedcnT*6372!#%&%^#$(&^$^*@%%*^)&(*%&**)&*%^&$&(*^%&*)")
            @Assert(String.withRawData(Array<Byte>(16384, repeat: 97u8)).size, 16384)
        }
    }
}
