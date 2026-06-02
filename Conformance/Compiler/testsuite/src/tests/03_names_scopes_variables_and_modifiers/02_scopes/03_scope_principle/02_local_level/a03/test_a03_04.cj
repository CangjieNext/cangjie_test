/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a03_04

  @Level:         1

  @Assertion:    3.2.3.2(3) The scope of local variables starts after the variable declaration 
                 and ends with the closing of the block.

  @Description:  Checks that variable defined within if-else block is not accessible for this one.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    if (true) {
    } else {
        let v1 : Int32 = v1 * v1
        let v2 = v2 / 11
        let v3 = "if_else block"
    }

    let v4 : Int32  = v1
    let v5 : Int64  = v2
    let v6 : String = v3
}
