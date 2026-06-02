/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a10_01

  @Level:         1

  @Assertion:    11.2(10) The type referenced in the generic declaration modified by public (the type argument
                 of the generic type, the upper bound in the where constraint) must be external. 
 
  @Description:  Check that compiler throws an error when type referenced in the generic declaration modified by public
                 is internal

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
*/

class C1 {

}

public func foo<T>() where T <: C1 {
    return "foo"
}

main() {
    return 0
}