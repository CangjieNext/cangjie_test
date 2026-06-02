/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a09_01

  @Level:         1

  @Assertion:    11.2(9) The type of typealias declaration modified by public must be external.
 
  @Description:  Check that complier throws an error when type of typealias declaration modified 
                 by public is internal.

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
*/
package pkg1

class C1<T> {

}

public type T1 = C1<Float64>


main() {
    return 0
}