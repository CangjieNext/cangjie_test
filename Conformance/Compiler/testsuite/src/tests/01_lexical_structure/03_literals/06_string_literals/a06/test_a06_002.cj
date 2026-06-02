/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_03_06_a06_002

  @Level:         1

  @Assertion:   1.3.6(6) There must be a line terminator after the beginning double quotations, 
                otherwise a compiler error is reported.

  @Description:  Checks that multi-line string literal cannot be represented with 
                 number of characters more than zero but without line terminator;

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:  

*/

main(){
    let stringValue:String = """123""";
    return 0;
}

