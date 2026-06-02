/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_03_a03_01

  @Level:         1

  @Assertion:    13.1.3.3(3)  The C language standard library printf function is
                 declared as follows: 

                     int printf(const Rune *format, ...) 
                 
                 The parameter Rune * type corresponds to Cangjie’s type CString
                 class, and the return type int corresponds to Cangjie’s Int32.
                 An example of creating a string and calling the printf function
                 is as follows:

                  package test 
                  foreign func printf(fmt: CString, ...): Int32 
                  main() {
                    unsafe {
                      let str: CString = LibC.mallocCString("hello world!\n")
                      printf(str)
                      LibC.free(str)
                    }
                  } 
 
  @Description:  Example from the Specification.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006634,0006642

  @Comment:      

*/
package test 

foreign func printf(fmt: CString, ...): Int32 

main() {
    unsafe {
        let str: CString = LibC.mallocCString("hello world!\n")
        printf(str)
        LibC.free(str)
    }
}
