/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a09_19

  @Level:         1

  @Assertion:    13.1.2.2(9)  As with the foreign functions, the parameters and
                 return types of other forms of CFunc must conform the CType
                 constraint, and named parameters and parameter default values
                 are not supported.

  @Description:  Class is not allowed in CFunc parameters.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

class ABC {
    public var f1 : Int32
    public ABC (x: Int32) { f1 = x }
}

main() {
    var CB: CFunc<(ABC)->Int32> = { x => x.f1 }
}
