/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a09_01

  @Level:         1

  @Assertion:    13.1.3.2(9) The following example shows how it can be used:
                    foreign func rand ():Int32
                    main() {
                        var ptr =CPointer <Int8 >(rand)
                        0
                    }

  @Description:  Check positive example behaves as expected

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

foreign func rand ():Int32
main() {
    var ptr =CPointer <Int8 >(rand)
    0
}
