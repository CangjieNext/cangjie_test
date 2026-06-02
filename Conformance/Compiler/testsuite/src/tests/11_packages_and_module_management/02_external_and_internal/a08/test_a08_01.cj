/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a08_01

  @Level:         1

  @Assertion:    11.2(8) The type of variable declaration including variable declaration in toplevel 
                 pattern modified by public must be external. 

  @Description:  Check that the type of variable declaration in toplevel pattern modified by public must
                 be external.

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
*/

package pkg1

open class C1<T> {

}

public var testA0801 = C1<Int64>()

main() {
    return 0
}