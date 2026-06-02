/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_a01_01
  @Assertion:       macro notMatchOrThrow(unexpected: Tokens, actual: Tokens)

  @Description:     Positive cases for enums: correct usages without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import utils.macros.*

enum Test { A | B | C(Int64) }
func f() { C(0) }

main() {
    // Constant as actual value.
    @notMatchOrThrow[A](B)
    @notMatchOrThrow[Test.A](C(0))
    @notMatchOrThrow[B](Test.A)
    @notMatchOrThrow[Test.B](Test.C(1))

    @notMatchOrThrow[C(0)](A)
    @notMatchOrThrow[Test.C(0)](Test.C(Int64(1)))
    @notMatchOrThrow[C(_)](A)

    // Variable as actual value.
    var test = A
    @notMatchOrThrow[B](test)
    @notMatchOrThrow[C(0)](test)
    @notMatchOrThrow[Test.C(_)](test)
    test = C(0)
    @notMatchOrThrow[A](test)
    @notMatchOrThrow[Test.C(1)](test)

    // Function call as actual value.
    @notMatchOrThrow[A](f())
    @notMatchOrThrow[C(1)](f())

    // An expression as actual value.
    @notMatchOrThrow[A](if (true) { B } else { C(0) })
    @notMatchOrThrow[A](if (false) { B } else { C(0) })
    @notMatchOrThrow[C(0)](match (true) {
                               case true => C(1)
                               case _ => A
                           })
    @notMatchOrThrow[C(_)](match (false) {
                               case true => C(1)
                               case _ => A
                           })
}
