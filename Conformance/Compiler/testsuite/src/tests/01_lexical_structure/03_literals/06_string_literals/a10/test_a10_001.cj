/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a10_001

  @Level:         1

  @Assertion:   1.3.6(10) A multi-line raw string literal starts with one or more number of # character
                and a double quotation ("), followed by any valid characters 
                (except one double quotation and the same number of # characters as the beginning), 
                and is terminated only by first matched double quotation (") 
                and the same number of # characters as the beginning.

  @Description:  Checks that multi-line raw string literal can be represented 
                 with different number of sign #.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main(){
    let stringValue_01:String = #"1111"#;

    let checkingString_01:String = "1111";
    Assert.equals(checkingString_01, stringValue_01, 
        reason:"The multi-line raw string literal with 1 sign '#' has incorrect value (" + stringValue_01 +")");

    let stringValue_02:String = ##"2222"##;
    let checkingString_02:String = "2222";
    Assert.equals(checkingString_02, stringValue_02, 
        reason:"The multi-line raw string literal with 2 signs '#' has incorrect value (" + stringValue_02 +")");

    let stringValue_03:String = ###"3333"###;
    let checkingString_03:String = "3333";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"The multi-line raw string literal with 3 signs '#' has incorrect value (" + stringValue_03 +")");

    let stringValue_04:String = ########"8888"########;
    let checkingString_04:String = "8888";
    Assert.equals(checkingString_03, stringValue_03, 
        reason:"The multi-line raw string literal with 8 signs '#' has incorrect value (" + stringValue_04 +")");

    return 0;
}

