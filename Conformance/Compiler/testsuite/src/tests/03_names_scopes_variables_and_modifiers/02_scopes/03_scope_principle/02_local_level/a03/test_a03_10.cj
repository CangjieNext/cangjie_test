/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a03_10

  @Level:         1

  @Assertion:    3.2.3.2(3) The scope of local variables starts after the variable declaration 
                 and ends with the closing of the block.

  @Description:  Checks that variable defined within if_expression block is not accessible before variable 
                 declarations.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    if (true) { 
        let v4 : Int32  = v1
        let v5 : Int64  = v2
        let v6 : String = v3

        let v1 : Int32 = 0
        let v2 : Int64 = 1
        let v3 : String = "if_than block"
    }
}