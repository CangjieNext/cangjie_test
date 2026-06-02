/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a13_01

  @Level:         1

  @Assertion:    13.1.2.2(13) The following example shows how it can be used:
                    main() {
                        var ptr =CPointer <Int8 >()
                        var f=CFunc <()->Unit >(ptr)
                        unsafe {f() }// core dumped when running, because the pointer is nullptr.
                    }


  @Description:  The example.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

main() {
    var ptr = CPointer <Int8 >()
    var f = CFunc<()->Unit >(ptr)
    unsafe{ f() } // core dumped when running, because the pointer is nullptr.
}
