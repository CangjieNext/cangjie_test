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
class Test_rawData {
    @TestCase
    func test_rawDate(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        let res = unsafe { str.rawData() }
        let bytes: Array<Byte> = [49, 227, 129, 171, 228, 184, 137, 240, 159, 153, 143, 240, 159, 143, 191, 240, 159,
            145, 169, 226, 128, 141, 240, 159, 145, 169, 226, 128, 141, 240, 159, 145, 167, 226, 128, 141, 240, 159, 145,
            166]
        @Expect(res, bytes)
    }
}
