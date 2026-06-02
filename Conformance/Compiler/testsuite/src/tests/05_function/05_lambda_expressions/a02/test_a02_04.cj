/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a02_04

  @Level:         1

  @Assertion:       5.5(2) The syntax of a Lambda expression is as follows. 
                    lambdaExpression 
                        : '{' NL* lambdaParameters? '=>' NL* expressionOrDeclarations '}' 
                    ; 
                    lambdaParameters
                        : lambdaParameter (',' lambdaParameter)* ','?
                    ;
                    lambdaParameter
                        : (identifier | '_') (':' type)?
                    ;
 
  @Description:     Check that wrong syntax for lambda expession will raise an error: missed , bw parameters.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct {
    let lambda0: (Int64, Int64) -> Int64 = {a: Int64 b: Int64 => a + b } 
}

main() {
}
