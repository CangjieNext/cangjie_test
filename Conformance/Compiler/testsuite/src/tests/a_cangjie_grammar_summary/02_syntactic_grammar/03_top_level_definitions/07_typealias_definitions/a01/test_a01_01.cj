/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_07_a01_01

  @Level:         1
  @Assertion:   A.2.3.7(1)
                typeAlias
                    : (typeModifier NL*)? TYPE_ALIAS NL* identifier (NL* typeParameters)?
                     NL* ASSIGN NL* type end*
                    ;
                typeModifier
                    : PUBLIC
                    ;


  @Description: Check trivial type alias declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

struct S1 { }

type myType = S1

public struct TestA0101<T> { }

public type myType2<U> = TestA0101<U>

main() {
    return 0
}