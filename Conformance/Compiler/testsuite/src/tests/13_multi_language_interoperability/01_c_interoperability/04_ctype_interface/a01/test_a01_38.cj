/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         13_01_04_a01_38

  @Level:         1

  @Assertion:    13.1.4(1) The CType interface is a language built-in empty
                 interface, which is the implementation of CType constraint and
                 is by implicitly implemented by all types supported in C
                 Interoperation.

  @Description:  Check if a Class implements CType.

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
    var Val: CType = ABC(22)
}
