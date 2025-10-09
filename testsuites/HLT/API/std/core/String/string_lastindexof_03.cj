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
class Test_lastIndexOf_12 {
    @TestCase
    func test_lastIndexOf_byte_with_fromindex(): Unit {
        // str [97, 240, 159, 153, 143, 240, 159, 143, 191, 240, 159, 153, 143, 240, 159, 143, 191, 97]
        let str = "a🙏🏿🙏🏿a"
        @Expect(str.lastIndexOf(UInt8(240), -1), Some(13))
        @Expect(str.lastIndexOf(UInt8(240), 0), Some(13))
        @Expect(str.lastIndexOf(UInt8(240), 1), Some(13))
        @Expect(str.lastIndexOf(UInt8(240), 2), Some(13))
        @Expect(str.lastIndexOf(UInt8(240), 13), Some(13))
        @Expect(str.lastIndexOf(UInt8(240), 14), None)
        @Expect(str.lastIndexOf(UInt8(240), 19), None)
        @Expect(str.lastIndexOf(UInt8(241), -1), None)
        @Expect(str.lastIndexOf(UInt8(UInt32(r'c')), -1), None)
    }
}
