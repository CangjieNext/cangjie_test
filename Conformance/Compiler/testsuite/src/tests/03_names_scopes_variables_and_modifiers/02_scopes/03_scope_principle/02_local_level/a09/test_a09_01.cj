/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a09_01

  @Level:         1

  @Assertion:    3.2.3.2(9) For instance, local-level names are inaccessible beyond its containing block,
                            and types defined in a block are inaccessible beyond its containing block
                            (e.g., a type defined in a class cannot be the return-type of a public 
                            function of the class).

  @Description:  Check that the variable defined into if_block is inaccessible beyond this block.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    let v1 = v
    if (true) {
       let v = 0
    }

    let v2 = v 
}
