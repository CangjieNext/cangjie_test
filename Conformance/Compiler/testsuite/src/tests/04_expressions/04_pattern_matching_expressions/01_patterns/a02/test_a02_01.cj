/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_a02_01

  @Level:         1

  @Assertion: 4.4.1(2) The syntax of patterns is defined as follows.
                pattern
                : constantPattern
                | wildcardPattern
                | varBindingPattern
                | tuplePattern
                | typePattern
                | enumPattern
                ;

  @Description: Validates compilation of some examples illustrating the syntax definition above.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

enum E {
    A | B | C
}

open class C1 {}
class C2 <: C1 {}

main() {
    let l1 = 1
    var m = match (l1) {
        case 1 => 1
        case 0 | 2 => 2
        case _ => 3
        case foo => 4
        case _: Int64 => 5
    }

    let l2 = ("1", "2")
    m = match (l2) {
        case ("1", "") => 1
        case ("1", "2") | ("0", "3") => 2
        case foo => 3
        case _: (String, Int64) => 4
        case _ => 5
    }

    let l3 = C2()
    m = match (l3) {
        case C1 => 1
        case C2 => 2
        case foo: C1 => 3
        case foo: C2 => 4
        case _: C1 => 5
        case _ => 6
    }

    let l4 = A
    m = match (l4) {
        case B => 1
        case C => 2
        case A | B => 3
        case foo => 4
        case _ => 5
    }

    return
}
