/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %export cjHeapsize=16gb && %run %run_opt %output %run_utest_opt %run_args

@Test
class Test_checkUtf8Encoding_01 {
    @TestCase
    func test_checkUtf8Encoding_01(): Unit {
        @Assert(String.checkUtf8Encoding([226u8, 255u8]), false)
        @Assert(String.checkUtf8Encoding([228u8, 187u8, 147u8, 233u8, 162u8, 137u8]), true)
        @Assert(String.checkUtf8Encoding([97u8, 98u8, 99u8, 100u8]), true)
        @Assert(String.checkUtf8Encoding(Array<Byte>()), true)
        @Assert(String.checkUtf8Encoding([214u8, 208u8, 206u8, 196u8]), false)
        @Assert(String.checkUtf8Encoding([99u8, 97u8, 102u8, 233u8]), false)
        @Assert(String.checkUtf8Encoding([128u8, 49u8, 48u8, 48u8]), false)
        @Assert(String.checkUtf8Encoding([147u8, 250u8, 150u8, 123u8, 140u8, 234u8]), false)
        @Assert(String.checkUtf8Encoding([210u8, 213u8, 211u8, 211u8, 201u8, 201u8, 217u8]), false)
    }
}
