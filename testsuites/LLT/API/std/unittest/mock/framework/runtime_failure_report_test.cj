/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// DEPENDENCE: ./stub_utils
// DEPENDENCE: ./line_number_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p stub_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt -p line_number_utils --mock=on %compile_lib_opt --output p3.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle p3.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import stub_utils.*
import line_number_utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public func stubA1(e: Example_LN): MethodActionSelector<String> {
    @On(e.a())
}

public func stubA2(e: Example_LN): MethodActionSelector<String> {
    @On(e.a())
}

public func stubA3(e: Example_LN): MethodActionSelector<String> {
    @On(e.a())
}

class F {
    public func getInt(i: Int64): String {
        return ""
    }

    public func bar(a: Any): String {
        ""
    }
}

@Test
public class RuntimeFailureTest {
    private let db = mock<BookDB>()
    private let id = mock<BookId>()
    private let pm = PreviewManager(db)

    @TestCase
    func argMismatch(): Unit {
        runtimeException<UnhandledCallException>(["db.byInt(3)", "[-] i <~> eq(3)"]) {
            @On(db.byInt(3)).returns("a")
            db.byInt(5)
        }
    }
}

abstract class DT {
    public func myMethod(): Unit
    public mut prop myProperty: Unit
    public var myField: Unit = ()
}
