/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_04_a09_02

  @Level:         1

  @Assertion:       5.1.4(9) The rules for deriving the return type of a function are as follows: the function body is
                    a sequence of expressions and declarations;  we denote the type of the last item of the sequence 
                    as T0 (if the last item of the block is an expression, it is the type of the expression; if the 
                    last item is a declaration, then T0 = Unit). 
                    Then we find all the return e expressions in the function body (including the ones in all 
                    sub-expressions) and denote the type of e as T1 ... Tn. The return type of the function is the 
                    least common super type of T0, T1, ..., Tn. If the least common super type does not exist, a 
                    compilation error is reported.

  @Description:     Check that usage of return expression without common supertype will ptoduce an error.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

func funcInt32(): Int32 { 12 }
func funcInt64(): Int64 { 12 }

func funcNumber(a: String) {
    if(a == "Int32") {
        return funcInt32()
    }
    if(a == "Int64") {
        return funcInt64()
    }
    return 12.0
}

main() {
}
