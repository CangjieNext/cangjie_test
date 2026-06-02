/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_20

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers 

  @Description:  Checks that a call of function with foreign modifier indicates calling an external function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

foreign func printf(fmt: CString, ...): Int32

main() {
    unsafe {
        let str: CString = LibC.mallocCString("hello world!\n")
        printf(str)
        LibC.free(str)
    }
}
