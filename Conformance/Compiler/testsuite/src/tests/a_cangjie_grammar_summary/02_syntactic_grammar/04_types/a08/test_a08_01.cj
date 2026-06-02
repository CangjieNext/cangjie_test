/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a08_01

  @Level:         1
  @Assertion:   A.2.4(8)
                userType
                    : (identifier NL* DOT NL*)* identifier ( NL* typeArguments)?
                    ;

  @Description: Check various user types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

open class Class1 { }
open class Class2<T> { }
interface I1 { }
struct S1 { }
type MyType = Int16
enum HandGame {
    ROCK | PAPER | SCISSORS
}


main() {
    var v1: Class1
    var v2: Class2<IntNative>
    var v3: I1
    var v4: MyType
    var v5: S1
    var v6: HandGame

    return 0
}
