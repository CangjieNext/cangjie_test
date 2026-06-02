/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_03_a04_01

  @Level:         1

  @Assertion:    13.1.3.3(4) Cangjie Array type does not conform to CType constraint, 
  so it is not allowed to be used as parameter type and return type in foreign functions.
 
  @Description:  Check Array as parameter type.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

foreign func func_01(x: Array<Int64>): Int8

main() {
    var Value : Int8 = unsafe { func_01([1, 2, 3, 3, 2, 1]); };
}
