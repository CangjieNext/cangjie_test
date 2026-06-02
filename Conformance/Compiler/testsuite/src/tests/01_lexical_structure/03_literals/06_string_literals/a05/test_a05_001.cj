/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a05_001

  @Level:         1

  @Assertion:   1.3.6(5) A multi-line string literal consists of zero or more valid characters 
                (except alone character \ and non-escaped characters """) enclosed by a pair 
                of three double quote characters ("""), 
                which begins after the line terminator of beginning double quotations 
                and ends before the first matched non-escaped ending double quotations.

  @Description:  Checks that multi-line string literal can be represented with zero characters and:
                 -  one line terminator of begining double quotations;
                 -  2 line terminators of begining double quotations;
                 -  5 line terminator of begining double quotations;

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main(){
    let stringValue_01:String = """
""";
    let checkingString_01:String = "";
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"The multi-line string literal with zero characters and one line terminator has incorrect value:\n" +
        stringValue_01);

    let stringValue_02:String = """

""";
    let checkingString_02:String = "\n";
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"The multi-line string literal with zero characters and 2 line terminators has incorrect value:\n" +
        stringValue_02);

    let stringValue_03:String = """




""";
    let checkingString_03:String = "\n\n\n\n";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"The multi-line string literal with zero characters and 5 line terminators has incorrect value:\n" +
        stringValue_03);

    return 0;
}

