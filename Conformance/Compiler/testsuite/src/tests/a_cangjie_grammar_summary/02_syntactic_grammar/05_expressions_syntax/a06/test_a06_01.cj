/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a06_01

  @Level:         1
  @Assertion:   A.2.5(6)
                tupleLiteral
                    : LPAREN NL* expression (NL* COMMA NL*expression)+ NL* RPAREN
                    ;

  @Description: Check some tuple literals.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
func foo() {
    321
}
main() {
    let unused = (1,2)
    let unused1 = (1,2,3,4,5,6,7,8,9,10)
    (1 + 1, 2 - 2, 3 * 3, 4.0 / 4.0)
    (true, 's', "asdsad", 0x23.2p1, (), 11..22:3, foo, { => 42})
    (true, ('s', ("asdsad", (0x23.2p1, ((), (11..22:3, (foo, ({ => 42}))))))))
    ((true, 's'), ("asdsad", 0x23.2p1), ((), 11..22:3), (foo, { => 42}))
    (true, ('s', ("asdsad", (0x23.2p1, ()), 11..22:3), foo), { => 42})
    (true, 's', "asdsad", 0x23.2p1, (), 11..22:3, foo, { => 42})
    ('c', if ({=> false}()) { 1 } else { 0 })
    ("Whaaat?", if ({=> false}()) { {=> 1}() })
    var e = 1
    (e, match (e) {
        case 0 => 2 + 2
        case _ => 2 - 2
    })
    var x = 1
    var mul = 1
    ("do-while", do {
        mul *= x
        x++
    } while (mul <= 10))
    return 0
}
