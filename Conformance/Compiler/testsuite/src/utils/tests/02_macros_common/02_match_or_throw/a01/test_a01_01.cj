/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_02_a01_01
  @Assertion:       macro matchOrThrow(expected: Tokens, actual: Tokens)

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
    @matchOrThrow[A](A)
    @matchOrThrow[Test.B](B)
    @matchOrThrow[C(0)](Test.C(0))
    @matchOrThrow[Test.C(_)](Test.C(Int64(0)))

    // Variable as actual value.
    var test = A
    @matchOrThrow[A](test)
    @matchOrThrow[Test.A](test)
    test = C(0)
    @matchOrThrow[C(0)](test)
    @matchOrThrow[Test.C(_)](test)

    // Function call as actual value.
    @matchOrThrow[C(0)](f())
    @matchOrThrow[C(_)](f())

    // An expression as actual value.
    @matchOrThrow[A](if (true) { A } else { C(0) })
    @matchOrThrow[C(0)](if (false) { A } else { C(0) })
    @matchOrThrow[C(_)](match (true) {
                            case true => C(0)
                            case _ => A
                        })
}
