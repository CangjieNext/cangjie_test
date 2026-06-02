/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a09_011

  @Level:         1

  @Assertion:   1.3.6(9) The syntax of the multi-line string literal is:
                   multiLineStringLiteral
                       : '"""' NL (multiLineStringExpression | multiLineStringContent)* '"""'
                       ;
                   multiLineStringExpression
                       : '${' end* (expressionOrDeclaration (end+ expressionOrDeclaration?)*) end* '}'
                       ;
                   multiLineStringContent
                       : MultiLineStrText
                       ;
                   MultiLineStrText
                       : ~('\\')
                       | EscapeSeq ;

  @Description:  Checks that multi-line string literal can be represented with multiLineStringExpressions;

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
    let stringValue_01:String = """
${1 + 2}
""";
    let checkingString_01:String = "3\n";
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"The multi-line string literal represented as lineStringExpression has incorrect value (" +
        stringValue_01 +")");

    let stringValue_02:String = """
lineStringExpression_01=${1 + 2}; lineStringExpression_02=${100 + 99};
""";
    let checkingString_02:String = "lineStringExpression_01=3; lineStringExpression_02=199;\n";
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"The multi-line string literal with two lineStringExpressions has incorrect value (" +
        stringValue_02 +")");

    return 0;
}

