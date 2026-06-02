/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_03_a01_02

  @Level:         1
   @Assertion:   2.1.7.3(1) Elements in specific locations can be accessed through tupleName[index]
                 (index indicates the location in the tuple which starting from `zero`,
                 and can only be an integer literal).

   @Description: Try to use UInt64 for index
   @Mode:        compileOnly
   @Negative:    yes
   @Structure:   single
   @Issue:       6494
 */

main() {
    var z1 = (123, 321)
    z1[1_u64]

    return 0
}
