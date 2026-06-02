/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a09_001

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

  @Description:  Checks that multi-line string literal can be represented with escaped
                 't', 'b', 'r'  characters.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
    let stringValue_01:String = """
escaped 't' 12\t34
""";
    let checkingString_01:String = "escaped 't' 12\t34\n";
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"The multi-line string literal with escaped 't' character has incorrect value (" + stringValue_01 +")");

    let stringValue_02:String = """
escaped 'b'123\b456
""";
    let checkingString_02:String = "escaped 'b'123\b456\n";
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"The multi-line string literal with escaped 'b' character has incorrect value (" + stringValue_02 +")");

    let stringValue_03:String = """
escaped 'r'123\r4
""";
    let checkingString_03:String = "escaped 'r'123\r4\n";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"The multi-line string literal with escaped 'r' character has incorrect value (" + stringValue_03 +")");

    return 0;
}

