/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// DEPENDENCE: ./stub_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p stub_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import stub_utils.*
import std.collection.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

//
// Note: long version of the test is in HLT
//

@Test
public class StubTest {
    let id = mock<BookId>()
    let db = mock<BookDB>()
    let pm = PreviewManager(db)

    @TestCase
    func testBasicConfiguration(): Unit {
        success {
            @On(
                db.getText(id)
            ).returns(
                "Chapter 1\nOnce upon a time...\nChapter 2\nThere was a princess\nChapter 3\nAnd a dragon")

            assertEquals(pm.getPreview(id), "Chapter 1\nOnce upon a time...\n")
        }
    }

    @TestCase
    func sameMatcher(): Unit {
        success {
            let realId = BookId()
            @On(
                db.getText(Matchers.same(realId))
            ).returns(
                "Chapter 1\nDragon ate the princess.\n")
            @On(
                db.getText(Matchers.same(id))
            ).returns(
                "Chapter 1\nOnce upon a time...\nChapter 2\nThere was a princess\nChapter 3\nAnd a dragon")
            assertEquals(pm.getPreview(realId), "Preview not available")
            assertEquals(pm.getPreview(id), "Chapter 1\nOnce upon a time...\n")
        }
    }

    @TestCase func sameMAtcherDifferentForm(): Unit {
        success {
            let id1 = BookId()
            let id2 = BookId()
            let id3 = BookId()
            @On(
                db.getText(same(id1))
            ).returns("a")
            assertEquals(db.getText(id1), "a")
            @On(
                db.getText(Matchers.same(id2))
            ).returns("b")
            assertEquals(db.getText(id2), "b")
            @On(
                db.getText(id3)
            ).returns("c")
            assertEquals(db.getText(id3), "c")
        }
    }

    @TestCase
    func stubShadowing(): Unit {
        success {
            @On(
                db.getText(same(id))
            ).returns("a")
            assertEquals(db.getText(id), "a")
            @On(
                db.getText(Matchers.same(id))
            ).returns("b")
            assertEquals(db.getText(id), "b")
            @On(
                db.getText(same(id))
            ).returns("c")
            assertEquals(db.getText(id), "c")
        }
    }

    @TestCase func stubShadowing2(): Unit {
        success {
            let otherId = BookId()
            @On(
                db.getText(same(id))
            ).returns("a")
            assertEquals(db.getText(id), "a")
            @On(
                db.getText(otherId)
            ).returns("b")
            assertEquals(db.getText(id), "a")
            assertEquals(db.getText(otherId), "b")
            @On(
                db.getText(same(id))
            ).returns("c")
            assertEquals(db.getText(id), "c")
            assertEquals(db.getText(otherId), "b")
            @On(
                db.getText(same(otherId))
            ).returns("d")
            assertEquals(db.getText(id), "c")
            assertEquals(db.getText(otherId), "d")
        }
    }

    @TestCase
    func successfulChain(): Unit {
        success {
            @On(
                db.getText(id)
            ).returns("a").once().then().returns("b")
            assertEquals(db.getText(id), "a")
            assertEquals(db.getText(id), "b")
            assertEquals(db.getText(id), "b")
            assertEquals(db.getText(id), "b")
        }
    }

    @TestCase func successfulChain2(): Unit {
        success {
            let id1 = BookId()
            let id2 = BookId()
            @On(
                db.getText(id1)
            ).returns("a").times(2).then().returns("b")
            @On(
                db.getText(id2)
            ).returns("a").once().then().returns("b").once().then().returns("c")
            assertEquals(db.getText(id1), "a")
            assertEquals(db.getText(id1), "a")
            assertEquals(db.getText(id1), "b")
            assertEquals(db.getText(id1), "b")
            assertEquals(db.getText(id2), "a")
            assertEquals(db.getText(id2), "b")
            assertEquals(db.getText(id2), "c")
            assertEquals(db.getText(id2), "c")
        }
    }

    @TestCase
    func eqMatcher(): Unit {
        success {
            @On(
                db.get(eq(A(5)))
            ).returns("a")

            @On(
                db.get(eq(A(6)))
            ).returns("b")

            assertEquals(db.get(A(5)), "a")
            assertEquals(db.get(A(6)), "b")
        }
    }

    @TestCase
    func defaultMatcher(): Unit {
        success {
            @On(
                db.get(default(A(5)))
            ).returns("a")

            @On(
                db.get(default(A(6)))
            ).returns("b")

            assertEquals(db.get(A(6)), "b")
            assertEquals(db.get(A(5)), "a")

            @On(
                db.getText(default(id))
            ).returns("c")

            assertEquals(db.getText(id), "c")
        }
    }

    @TestCase
    func anyMatcher(): Unit {
        success {
            @On(
                db.get(any())
            ).returns("a")

            assertEquals(db.get(A(6)), "a")
            assertEquals(db.get(A(5)), "a")
            assertEquals(db.get(A(6)), "a")
            assertEquals(db.get(A(-2)), "a")

            @On(
                db.get(any())
            ).returns("b")

            assertEquals(db.get(A(6)), "b")
            assertEquals(db.get(Base()), "b")
            assertEquals(db.get(B()), "b")
        }
    }

    @TestCase
    func ofTypeMatcher(): Unit {
        success {
            @On(
                db.get(any())
            ).returns("a")

            @On(
                db.get(ofType<A>())
            ).returns("b")

            assertEquals(db.get(A(6)), "b")
            assertEquals(db.get(A(7)), "b")
            assertEquals(db.get(B()), "a")
            assertEquals(db.get(Base()), "a")
        }
    }

    @TestCase
    func argThatMatcher(): Unit {
        success {
            @On(
                db.get(any())
            ).returns("a")
            @On(
                db.get(argThat { a: A => a.n == 6 || a.n == 8 })
            ).returns("b")

            assertEquals(db.get(A(6)), "b")
            assertEquals(db.get(A(7)), "a")
            assertEquals(db.get(A(8)), "b")
            assertEquals(db.get(Base()), "a")
            assertEquals(db.get(B()), "a")
        }
    }

    @TestCase
    func argThatNotMatcher(): Unit {
        success {
            @On(
                db.get(any())
            ).returns("a")
            @On(
                db.get(argThatNot { a: A => a.n == 6 || a.n == 8 })
            ).returns("b")

            assertEquals(db.get(A(6)), "a")
            assertEquals(db.get(A(7)), "b")
            assertEquals(db.get(A(8)), "a")
            assertEquals(db.get(Base()), "b")
            assertEquals(db.get(B()), "b")
        }
    }

    @TestCase func matcherCombinations1(): Unit {
        success {
            @On(
                db.y(any(), any())
            ).returns("a")
            @On(
                db.y(argThat { a: A => a.n == 6 || a.n == 8 }, argThat { a: A => a.n == 6 || a.n == 8 })
            ).returns("b")

            assertEquals(db.y(A(6), A(7)), "a")
            assertEquals(db.y(A(6), A(9)), "a")
            assertEquals(db.y(A(6), A(8)), "b")
            assertEquals(db.y(A(6), A(6)), "b")
            assertEquals(db.y(A(8), A(6)), "b")
            assertEquals(db.y(A(8), B()), "a")
        }
    }

    @TestCase func matcherCombinations2(): Unit {
        success {
            @On(
                db.y(eq(A(6)), any())
            ).returns("first is A(6)")
            @On(
                db.y(ofType<B>(), any())
            ).returns("first b")
            @On(
                db.y(any(), ofType<B>())
            ).returns("second b")
            @On(
                db.y(ofType<A>(), ofType<A>())
            ).returns("both a")

            assertEquals(db.y(A(6), A(7)), "both a")
            assertEquals(db.y(A(6), B()), "second b")
            assertEquals(db.y(A(6), Base()), "first is A(6)")
            assertEquals(db.y(B(), A(6)), "first b")
        }
    }

    @TestCase func matcherCombinationsAndChains(): Unit {
        success {
            @On(
                db.y(ofType<B>(), any())
            ).returns("first b").times(2).then().returns("don't know")
            @On(
                db.y(any(), ofType<B>())
            ).returns("second b").once().then().returns("xx")

            assertEquals(db.y(A(6), B()), "second b")
            assertEquals(db.y(A(6), B()), "xx")
            assertEquals(db.y(A(6), B()), "xx")
            assertEquals(db.y(B(), A(6)), "first b")
            assertEquals(db.y(B(), A(8)), "first b")
            assertEquals(db.y(B(), A(8)), "don't know")
            assertEquals(db.y(B(), A(8)), "don't know")
        }
    }

    @TestCase func matcherCombinationsAndExpectations2(): Unit {
        success {
            @On(
                db.get(any())
            ).returns("a")

            @On(
                db.get(only5())
            ).returns("b")

            assertEquals(db.get(A(6)), "a")
            assertEquals(db.get(A(5)), "b")
        }
    }

    @TestCase func consequitivelyActions(): Unit {
        success {
            @On(
                db.x()
            ).returnsConsecutively(["a", "b", "c", "d"])

            assertEquals(db.x(), "a")
            assertEquals(db.x(), "b")
            assertEquals(db.x(), "c")
            assertEquals(db.x(), "d")
            let list = ArrayList<String>()
            list.add("d")
            list.add("e")
            list.add("f")

            @On(
                db.x()
            ).returnsConsecutively(list)

            assertEquals(db.x(), "d")
            assertEquals(db.x(), "e")
            assertEquals(db.x(), "f")
        }
    }

    @TestCase func integerArguments(): Unit {
        success {
            @On(
                db.byInt(5)
            ).returns("a")
            @On(
                db.byInt(7)
            ).returns("b")
            assertEquals(db.byInt(5), "a")
            assertEquals(db.byInt(7), "b")
        }
    }

    @TestCase func structArguments(): Unit {
        success {
            let mockDB = mock<BookDB>()
            let str1 = MyStruct("a")
            let str1copy = MyStruct("a")
            let str2 = MyStruct("b")
            @On(mockDB.byStruct(any())).returns("a")
            @On(mockDB.byStruct(str1)).returns("b")
            assertEquals(mockDB.byStruct(str1), "b")
            assertEquals(mockDB.byStruct(str1copy), "b")
            assertEquals(mockDB.byStruct(str2), "a")
        }
    }

    @TestCase func returnTypes(): Unit {
        success {
            let t = mock<ReturnTypes>()
            // @On(t.getClass()).returns(A(5))
            @On(t.getInt()).returns(5)
            @On(t.getIntByInt(5)).returns(6)
            @On(t.getIntByInt(6)).returns(7)
            @On(t.getStruct()).returns(MyStruct("aba"))
            assertEquals(t.getInt(), 5)
            assertEquals(t.getIntByInt(5), 6)
            assertEquals(t.getIntByInt(6), 7)
            assertEquals(t.getStruct(), MyStruct("aba"))
        }
    }

    @TestCase func wildcardSyntaxSugar(): Unit {
        success {
            let db = mock<BookDB>()
            @On(db.getText(_)).returns("foo")
            @On(db.get(_)).returns("bar")
            assertEquals(db.getText(mock<BookId>()), "foo")
            assertEquals(db.get(Base()), "bar")
        }
    }

    @TestCase func eqToVar(): Unit {
        success {
            let db = mock<BookDB>()
            var x = 3
            @On(db.byInt(x)).returns("foo")
            assertEquals(db.byInt(3), "foo")
        }
    }

    @TestCase func complexCustomMatcher(): Unit {
        success {
            let db = mock<BookDB>()
            @On(db.byInt(custom(5, 3) {
                arg: Int64, str: String =>
                    str == "foo"
            })).returns("bar1")
            var x = 3
            @On(db.byInt(custom(10, 9) {
                arg: Int64, str: String =>
                    arg - 5 + str.size == 0
            })).returns("bar2")
            assertEquals(db.byInt(3), "bar1")
            assertEquals(db.byInt(2), "bar2")
        }
    }

    @TestCase func returnsUnitHelper() {
        success {
            let x = mock<X>()
            @On(x.a(5)).returns().times(2)
            x.a(5)
            x.a(5)
        }
    }

    @TestCase func returnsFactory() {
            let db = mock<BookDB>()
            let factory = ["1", "2", "3"].iterator()
            @On(db.byInt(_)).returns {
                factory.next().getOrThrow()
            }
            assertEquals(db.byInt(3), "1")
            assertEquals(db.byInt(3), "2")
            assertEquals(db.byInt(3), "3")
    }
}

class X {
    func a(i: Int): Unit { }
}

extend Matchers {
    static func only5(): TypedMatcher<A> {
        return argThat<A> {
            a: A => a.n == 5
        }
    }

    static func custom(i: Int64, j: Int64, lambda: (Int64, String) -> Bool): TypedMatcher<Int64> {
        return argThat<Int64> {
            arg: Int64 =>
                lambda(arg, "foo")
        }
    }
}
