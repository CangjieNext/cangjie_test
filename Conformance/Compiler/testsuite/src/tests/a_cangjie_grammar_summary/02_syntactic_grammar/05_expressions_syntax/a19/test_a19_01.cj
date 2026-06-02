/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a19_01

  @Level:         1
  @Assertion:   A.2.5(19)
                block
                    : LCURL expressionOrDeclarations RCURL
                    ;


  @Description: Check some block expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

public func foo() {
    1.2
}

class C1 {
    var a: String = "The night is too long"
}
interface I1 { }

main() {
    if ({=> true}()) {
        {=> 2}()
    } else {
        {=> '3'}()
    }

    var arr = [1,2,3,4,5]
    var res = 0
    for (x in arr) {
        res += x
    }

    try {
        {=> 2 + 2}()
    } catch(_) {
        {=> 4}()
    } finally { }

    return 0
}
