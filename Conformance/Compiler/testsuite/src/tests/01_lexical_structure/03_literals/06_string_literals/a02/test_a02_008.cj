/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a02_008

  @Level:         1

  @Assertion:   1.3.6(2) A single-line string literal consists of zero or more characters 
                (except non-escaped character " and alone character \) 
                enclosed by a pair of double quote character (i.e., ").


  @Description:  Checks that single-line string literal can be represented with number of characters more than zero.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main(){
    let stringValue:String = "123 abc";
    let checkingString:String = "123" + " " + "abc";
    Assert.equals(checkingString, stringValue, 
        reason:"The single-line string literal with number of characters more than zero has incorrect value (" +
        stringValue +")");
    return 0;
}

