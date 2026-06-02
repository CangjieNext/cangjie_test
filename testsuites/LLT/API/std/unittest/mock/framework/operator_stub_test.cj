/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

class Operators {
    public operator func +(i: Int64): Int64 {
        return 4 + i
    }

    public operator func -(i: String): String {
        return ""
    }

    public operator func *(b: Bool): Bool {
        return false
    }

    public operator func /(i: Int64): Bool {
        return true
    }

    public operator func %(i: Int64): Bool {
        return true
    }

    public operator func **(i: Int64): Bool {
        return true
    }

    public operator func <(i: Int64): Bool {
        return false
    }

    public operator func >(i: Int64): Bool {
        return false
    }

    public operator func <=(i: Int64): Bool {
        return false
    }

    public operator func >=(i: Int64): Bool {
        return false
    }

    public operator func ==(i: Int64): Bool {
        return false
    }

    public operator func !=(i: Int64): Bool {
        return false
    }

    public operator func <<(i: Int64): Bool {
        return false
    }

    public operator func >>(i: Int64): Bool {
        return false
    }

    public operator func |(i: Int64): Bool {
        return false
    }

    public operator func &(i: Int64): Bool {
        return false
    }

    public operator func ^(i: Int64): Bool {
        return true
    }

    public operator func !(): Bool {
        return true
    }

    public operator func -(): Bool {
        return true
    }

    public operator func [](i: Int64): String {
        return ""
    }

    public operator func [](i: Int64, b: Bool): String {
        return ""
    }

    public operator func [](i: Int64, s: String, b: Bool): String {
        return ""
    }

    public operator func [](i: Int64, value!: String): Unit {
    }
}

@Test
public class StubOperatorsTest {
    private let op = mock<Operators>()

    @TestCase
    func testArithmeticBinary(): Unit {
        success {
            @On(op + 3).returns(5)
            assertEquals(op + 3, 5)

            @On(op - eq("ab")).returns("foo")
            assertEquals(op - "ab", "foo")

            @On(op * true).returns(false)
            @On(op * false).returns(true)
            assertEquals(op * true, false)
            assertEquals(op * false, true)

            @On(op / ofType<Int64>()).returns(false)
            @On(op / 3).returns(true)
            assertEquals(op / 1, false)
            assertEquals(op / 2, false)
            assertEquals(op / 3, true)

            @On(op % 3).returns(true)
            assertEquals(op % 3, true)

            @On(op ** 3).returns(true)
            assertEquals(op ** 3, true)
        }
    }

    @TestCase
    func testCompareBinary(): Unit {
        success {
            @On(op < 3).returns(true)
            assertEquals(op < 3, true)

            @On(op > 3).returns(true)
            assertEquals(op > 3, true)

            @On(op >= 3).returns(true)
            assertEquals(op >= 3, true)

            @On(op <= 3).returns(true)
            assertEquals(op <= 3, true)

            @On(op == 3).returns(true)
            assertEquals(op == 3, true)

            @On(op != 3).returns(true)
            assertEquals(op != 3, true)
        }
    }

    @TestCase
    func testBitBinary(): Unit {
        success {
            @On(op ^ 3).returns(true)
            assertEquals(op ^ 3, true)

            @On(op & 3).returns(true)
            assertEquals(op & 3, true)

            @On(op | 3).returns(true)
            assertEquals(op | 3, true)

            @On(op >> 3).returns(true)
            assertEquals(op >> 3, true)

            @On(op << 3).returns(true)
            assertEquals(op << 3, true)
        }
    }

    @TestCase
    func testUnary(): Unit {
        success {
            @On(!op).returns(true)
            assertEquals(!op, true)

            @On(-op).returns(true)
            assertEquals(-op, true)
        }
    }

    @TestCase
    func testSubscript(): Unit {
        success {
            @On(op[ofType<Int64>()]).returns("any")
            @On(op[5]).returns("5")
            @On(op[6]).returns("6")

            assertEquals(op[5], "5")
            assertEquals(op[6], "6")
            assertEquals(op[7], "any")
            assertEquals(op[8], "any")

            @On(op[5, ofType<String>(), false]).returns("1")
            @On(op[ofType<Int64>(), ofType<String>(), true]).returns("2")
            assertEquals(op[5, "foobar", false], "1")
            assertEquals(op[8, "barfoo", true], "2")

            @On(op[5, ofType<String>(), false]).returns("1")
            @On(op[ofType<Int64>(), ofType<String>(), true]).returns("2")
            assertEquals(op[5, "foobar", false], "1")
            assertEquals(op[8, "barfoo", true], "2")

            @On(op[any()] = any()).throws(Exception("foo"))
            @On(op[6] = "").returns(())
            @On(op[7] = "a").returns(())
            op[6] = ""
            op[7] = "a"
            assertThrows<Exception> {
                op[6] = "a"
            }
            assertThrows<Exception> {
                op[7] = ""
            }
            assertThrows<Exception> {
                op[1] = ""
            }
            assertThrows<Exception> {
                op[2] = "55"
            }
        }
    }

    @TestCase
    func testSubscriptOperatorTypeinference(): Unit {
        success {
            // type inference doesn't work here for some reason
            // @On(op[_]).returns("any")
            // assertEquals(op[8], "any")

            @On(op[_] = _).returns(())
            op[3] = ""
        }
    }
}
