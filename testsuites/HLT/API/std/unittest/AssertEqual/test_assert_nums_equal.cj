/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

@Test
public class Test_AssertEqual_Nums_Positive {
    @TestCase
    func case_assert_equal_Integer(): Unit {
        @Expect(0i8, Int8(0))
        @Expect(0i16, Int16(0))
        @Expect(0i32, Int32(0))
        @Expect(0i64, Int64(0))
        @Expect(0u8, UInt8(0))
        @Expect(0u16, UInt16(0))
        @Expect(0u32, UInt32(0))
        @Expect(0u64, UInt64(0))
    }

    @TestCase
    func case_assert_equal_Float(): Unit {
        let f1: Float64 = 3.1415
        let f2: Float32 = 3.1415
        let f3: Float16 = 3.1415
        @Expect(3.1415f64, f1)
        @Expect(3.1415f32, f2)
        @Expect(3.1415f16, f3)
    }

    @TestCase
    func case_assert_equal_convert(): Unit {
        @Expect(0i8, Int8(Int16(Int32(Int64(0)))))
        @Expect(0i64, Int64(Int32(Int16(Int8(0)))))
        @Expect(0u8, UInt8(UInt16(UInt32(UInt64(0)))))
        @Expect(0u64, UInt64(UInt32(UInt16(UInt8(0)))))
    }
}
