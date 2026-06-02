/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

class Data <: ToString {
    func opt(isSome: Bool): ?Data {
        match (isSome) {
            case true => this
            case _ => None
        }
    }

    func foo(): Data {
        this
    }

    func fooThrowing(): Data {
        throw Exception()
    }

    public func toString() {
        "Data"
    }
}

extend Option<Data> {
    func opt(isSome: Bool): ??Data {
        match (isSome) {
            case true => this
            case _ => None
        }
    }

    func foo(): ?Data {
        this
    }
}

@Test
public class OptionalExprTest {
    @TestCase
    func case1(): Unit {
        let something = Data()
        @PowerAssert(something.opt(true)?.foo()?.foo()?.opt(true)?.foo()?.opt(false).isNone())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}something.opt(true)?.foo()?.foo()?.opt(true)?.foo()?.opt(false).isNone(){/COLOR})`
                    |_________|         |      |      |          |      |           |
                    |   Data            |      |      |          |      |           |
                    |___________________|      |      |          |      |           |
                    |     Some(Data)           |      |          |      |           |
                    |__________________________|      |          |      |           |
                    |        Some(Data)               |          |      |           |
                    |_________________________________|          |      |           |
                    |            Some(Data)                      |      |           |
                    |____________________________________________|      |           |
                    |              Some(Some(Data))                     |           |
                    |___________________________________________________|           |
                    |                  Some(Some(Data))                             |
                    |_______________________________________________________________|
                                                Some(None)
     */
    @TestCase
    func caseException(): Unit {
        let something = Data()
        @PowerAssert(something.opt(true)?.foo()?.foo()?.fooThrowing().isSome())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}something.opt(true)?.foo()?.foo(){/COLOR}{COLOR=RED}?.fooThrowing(){/COLOR}{COLOR=GRAY}.isSome(){/COLOR})`
                    |_________|         |      |      |              |        |
                    |   Data            |      |      |              |        |
                    |___________________|      |      |              |        |
                    |     Some(Data)           |      |              |        |
                    |__________________________|      |              |        |
                    |        Some(Data)               |              |        |
                    |_________________________________|              |        |
                    |            Some(Data)                          |        |
                    |________________________________________________|        |
                    |                   [Exception]                           |
                    |_________________________________________________________|
                                           [not computed]
     */
}
