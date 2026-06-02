/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./json01.json
// DEPENDENCE: ./json02.json
// DEPENDENCE: ./json03.json
// DEPENDENCE: ./json04.json
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.unittest.data.*

@Test
public class Test_Json_01 {
    @TestCase[value in json("json01.json")]
    func test01(value: Int64) {
        @Expect(value, 10101010)
    }

    @TestCase[value in json("json02.json")]
    func test02(value: String) {
        @Expect(value, "中文")
    }

    @TestCase[value in json("json03.json")]
    func test03(value: Array<Int64>) {
        @Expect(value.size, 4)
    }

    @TestCase[value in json("json04.json")]
    func test04(value: Array<Int64>) {
        @Expect(value.size, 4)
    }
}
