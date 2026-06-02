/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a04_01

  @Level:         1

  @Assertion:    13.1.2.3(4) The type of the modified object must meet the CType
                 constraint, but cannot be CString;

  @Description:  Use of inout modifier with CString.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

@C
func func_01(Ptr: CPointer<CString>): Unit {
}

main() {
    var Arg : CString = CString("abcd");
    unsafe{ func_01(inout: Arg) }
}