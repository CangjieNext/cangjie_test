/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a12_001

  @Level:         1

  @Assertion:   1.3.6(12) Different from the multi-line string literals, escaping rules do not apply 
                in a multi-line raw string.

  @Description:  Checks that multi-line raw string literal does not understand escaped characters.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main(){
    let stringValue_01:String =###"multi-line raw string [\t, \b, \r, \n, \', \"] "###;
    let checkingString_01:String = """
multi-line raw string [\\t, \\b, \\r, \\n, \\', \\"] """;
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"The multi-line raw string literal with escaped characters has incorrect value:\n" + stringValue_01);

    let stringValue_02:String =###"multi-line raw string [\\, \f, \v, \0, \$] "###;
    let checkingString_02:String = """
multi-line raw string [\\\\, \\f, \\v, \\0, \\$] """;
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"The multi-line raw string literal with escaped characters has incorrect value:\n" + stringValue_02);

    return 0;
}




