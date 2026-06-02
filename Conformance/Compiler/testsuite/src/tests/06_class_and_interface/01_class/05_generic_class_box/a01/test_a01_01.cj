
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a01_01

  @Level:         1

  @Assertion: 6.1.5(1)
              In the Cangjie programming language, a built-in generic class called Box is supported,
              which wraps all types as reference types.

  @Description: Check that the class Box can wrap all types

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006077

  @Comment: By creating immutable variables and changing object fields we prove that the Box type is a reference type

*/

import utils.assert.Assert

struct S {
    S(let s: Int64) {}
}

enum E {
    E1(String) |
    E2(Rune)
}

class C {
    C(let x: Int64) {}
}

main() {
    let case1 = Box<Int64>(1)
    Assert.equals(1, case1.value)
    case1.value = 2
    Assert.equals(2, case1.value)

    let case2 = Box<Float64>(0.001)
    Assert.approxEquals(0.001, case2.value)
    case2.value = 1.48
    Assert.equals(1.48, case2.value)

    let case3 = Box<Rune>(r'r')
    Assert.equals(r'r', case3.value)
    case3.value = r'v'
    Assert.equals(r'v', case3.value)

    let case4 = Box<String>("FFF")
    Assert.equals("FFF", case4.value)
    case4.value = ""
    Assert.equals("", case4.value)

    let case5 = Box<Unit>(())
    Assert.isTrue(case5.value is Unit)
    case5.value = ()
    Assert.isTrue(case5.value is Unit)

    let case6 = Box<(Int64, Rune)>((10, r'c'))
    Assert.equals(10, case6.value[0])
    Assert.equals(r'c', case6.value[1])
    case6.value = (-1, r'q')
    Assert.equals(-1, case6.value[0])
    Assert.equals(r'q', case6.value[1])

    let case7 = Box<Range<Int64>>(1..10:2)
    Assert.equals(1..10:2, case7.value)
    case7.value = -1..=100:3
    Assert.equals(-1..=100:3, case7.value)

    let case8 = Box<(String) -> String>({x: String => x + "1"})
    Assert.equals("11", case8.value("1"))
    case8.value = {x: String => x + "2"}
    Assert.equals("12", case8.value("1"))

    let case9 = Box<S>(S(6))
    Assert.equals(6, case9.value.s)
    case9.value = S(7)
    Assert.equals(7, case9.value.s)

    let case10 = Box<E>(E2(r'r'))
    let before = match(case10.value) {
        case E2(x) => x
        case _ => r' '
    }
    Assert.equals(r'r', before)
    case10.value = E1("s")
    let after = match(case10.value) {
        case E1(x) => x
        case _ => ""
    }
    Assert.equals("s", after)

    let case11 = Box<VArray<Int64, $2>>([1, 1])
    Assert.equals(1, case11.value[1])
    case11.value = [1, 2]
    Assert.equals(2, case11.value[1])

    let case12 = Box<Array<Int64>>([2, 1])
    Assert.equals([2, 1], case12.value)
    case12.value = [1, 2]
    Assert.equals([1, 2], case12.value)

    let case13 = Box<C>(C(3))
    Assert.equals(3, case13.value.x)
    case13.value = C(9)
    Assert.equals(9, case13.value.x)

    let case14 = Box<Box<Int64>>(Box<Int64>(5))
    Assert.equals(5, case14.value.value)
    case14.value = Box<Int64>(10)
    Assert.equals(10, case14.value.value)

    let case15 = Box<Box<Box<String>>>(Box<Box<String>>(Box<String>("str")))
    Assert.equals("str", case15.value.value.value)
    case15.value.value.value = "NNN"
    Assert.equals("NNN", case15.value.value.value)
    case15.value.value = Box<String>("F")
    Assert.equals("F", case15.value.value.value)
    case15.value = Box<Box<String>>(Box<String>("PPPP"))
    Assert.equals("PPPP", case15.value.value.value)
}