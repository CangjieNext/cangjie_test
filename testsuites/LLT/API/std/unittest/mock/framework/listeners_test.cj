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

@Test
public class ListenersTest {
    let db = mock<BookDB>()

    @TestCase
    func argumentListener(): Unit {
        success {
            let x = Box<Bool>(false)
            let listener = ValueListener<Base>.onEach {
                value: Base =>
                let n = (value as A).getOrThrow().n
                assertEquals(n, 5)
                x.value = true
            }
            @On(
                db.get(capture(listener))
            ).returnsConsecutively(["a"])

            assertEquals(db.get(A(5)), "a")

            assertEquals(x.value, true)
            assertEquals((listener.lastValue().getOrThrow() as A).getOrThrow({=> Exception("not an A")}), A(5))
            let allValues = listener.allValues()
            assertEquals(allValues.size, 1)
            assertEquals((allValues[0] as A).getOrThrow(), A(5))
        }
    }

    @TestCase
    func argumentListener2(): Unit {
        success {
            let args = ArrayList<Int64>()
            let listener = ValueListener<Base>.onEach {
                value: Base =>
                let n = (value as A).getOrThrow().n
                args.add(n)
            }
            @On(
                db.get(capture(listener))
            )
                .returnsConsecutively(["a", "b"])
                .then()
                .returnsConsecutively(["c", "d"])

            assertEquals(db.get(A(5)), "a")
            assertEquals(db.get(A(6)), "b")
            assertEquals(db.get(A(7)), "c")
            assertEquals(db.get(A(8)), "d")
            assertEquals((listener.lastValue().getOrThrow() as A).getOrThrow({=> Exception("not an A")}), A(8))
            let allValues = listener.allValues()
            assertEquals(allValues.size, 4)

            assertEquals(args.toArray(), [5, 6, 7, 8])
        }
    }

    @TestCase
    func argThatMatcherWithListener(): Unit {
        success {
            let args = ArrayList<Int64>()
            let listener = ValueListener<Base>.onEach {
                value: Base =>
                let n = (value as A)?.n ?? -100
                args.add(n)
            }
            let predicate = {a: Base => ((a as A)?.n ?? 0) == 6 || (((a as A)?.n ?? 0) == 8)}
            @On(
                db.get(any())
            ).returns("a")
            @On(
                db.get(argThat(listener, predicate))
            ).returns("b")

            assertEquals(db.get(A(6)), "b")
            assertEquals(db.get(A(7)), "a")
            assertEquals(db.get(A(8)), "b")
            assertEquals(db.get(Base()), "a")
            assertEquals(db.get(B()), "a")

            @PowerAssert(args.toArray() == [6, 8])
        }
    }
}
