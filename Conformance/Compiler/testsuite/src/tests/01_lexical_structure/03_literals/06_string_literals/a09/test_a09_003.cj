/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a09_003

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
                 'v', '0', '$'  characters.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
    let stringValue_01:String = """
escaped 'v' 12\v34
""";
    let checkingString_01:String = "escaped 'v' 12\v34\n";
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"The multi-line string literal with escaped 'v' character has incorrect value (" + stringValue_01 +")");

    let stringValue_02:String = """
escaped '0' 123\0456
""";
    let checkingString_02:String = "escaped '0' 123\0456\n";
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"The multi-line string literal with escaped '0' character has incorrect value (" + stringValue_02 +")");

    let stringValue_03:String = """
escaped '$' 123\$45
""";
    let checkingString_03:String = "escaped '$' 123\$45\n";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"The multi-line string literal with escaped '$' character has incorrect value (" + stringValue_03 +")");

    return 0;
}

