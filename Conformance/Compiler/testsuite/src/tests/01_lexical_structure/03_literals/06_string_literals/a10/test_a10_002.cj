/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a10_002

  @Level:         1

  @Assertion:   1.3.6(10) A multi-line raw string literal starts with one or more number of # character
                and a double quotation ("), followed by any valid characters 
                (except one double quotation and the same number of # characters as the beginning), 
                and is terminated only by first matched double quotation (") 
                and the same number of # characters as the beginning.

  @Description:  Checks that multi-line raw string literal cannot be represented 
                 with content containing one double quotation and the same number signes as the begining.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:  

*/

main(){
    let stringValue_01:String = ###"multi-line raw string literal with one double quotation
and the same number singes as the begining: "###;      "###;

    return 0;
}

