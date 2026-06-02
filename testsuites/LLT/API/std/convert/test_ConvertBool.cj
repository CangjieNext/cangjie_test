/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.convert.*

@Test
class ConvertBoolTest {
    @TestCase
    func parse(): Unit {
        let testVars: Array<(String, Bool)> = [("true", true), ("false", false)]

        for (testVar in testVars) {
            @Expect(testVar[1], Bool.parse(testVar[0]))
        }
    }

    @TestCase
    func parseException(): Unit {
        let testVars: Array<(String, String)> = [("", "Fail to convert to Bool."), ("rue", "Fail to convert to Bool."),
            ("alse", "Fail to convert to Bool.")]

        for (testVar in testVars) {
            try {
                var _ = Bool.parse(testVar[0])
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, testVar[1])
            }
        }
    }

    @TestCase
    func tryParse(): Unit {
        let testVars: Array<(String, Bool)> = [("true", true), ("True", false), ("Ture", false), ("falsE", false),
            ("0x1p2", false), ("0x.2p4", false), ("", false), ("false", false)]

        for (testVar in testVars) {
            var ret: Option<Bool> = Bool.tryParse(testVar[0])
            var boolRet: Bool = match (ret) {
                case Some(s) => s
                case None => false
            }
            @Expect(testVar[1], boolRet)
        }
    }
}
