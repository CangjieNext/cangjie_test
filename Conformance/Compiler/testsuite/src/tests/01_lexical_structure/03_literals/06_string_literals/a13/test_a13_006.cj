/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a13_006

  @Level:         1

  @Assertion:   1.3.6(13) The syntax of the multi-line raw string literal is:
                MultiLineRawStringLiteral
                    : MultiLineRawStringContent
                    ;
                fragment MultiLineRawStringContent
                    : '#' MultiLineRawStringContent '#'
                    | '#' '"' .*? '"' '#'
                    ;

  @Description:  Checks that multi-line raw string literal can be represented with content
                 containing some signs '#' or some '"'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  
*/

import utils.assert.*

main(){
//test case N1
    let stringValue_01:String =###"11 ### 22"###;
    let checkingString_01:String = "11 ### 22";
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"The multi-line raw string literal with 3 '#' has incorrect value:\n" + stringValue_01);

//test case N2
    let stringValue_02:String =###"1111 "" 2222"###;
    let checkingString_02:String = "1111 \"\" 2222";
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"The multi-line raw string literal with 2 '\"' has incorrect value:\n" + stringValue_02);

//test case N3
    let stringValue_03:String =###"1 """ 2"###;
    let checkingString_03:String = "1 \"\"\" 2";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"The multi-line raw string literal with 3 '\"' has incorrect value:\n" + stringValue_03);

    return 0;
}




