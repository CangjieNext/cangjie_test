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
class Test_indexof_11 {
    @TestCase
    func test_indexof_byte(): Unit {
        let str = "a🙏🏿🙏🏿a"
        @Expect(str.indexOf(UInt8(240)), Some(1))
        @Expect(str.indexOf(UInt8(UInt32(r'a'))), Some(0))
        @Expect(str.indexOf(UInt8(241)), None)
        @Expect(str.indexOf(UInt8(UInt32(r'c'))), None)
    }
}
