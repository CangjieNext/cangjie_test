/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a01_01

  @Level:         1

  @Assertion:    13.1.1(1) Since it is too easy to cause unsafety in C language,
                 all the interoprations with C language in Cangjie are available
                 only in unsafe contexts.

  @Description:  Check that a call to foreign function is not allowed outside of
                 unsafe block.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign func puts(ptr: CString): Unit

main() {
    var Text : CString = CString("abcde");
    puts(Text);
}