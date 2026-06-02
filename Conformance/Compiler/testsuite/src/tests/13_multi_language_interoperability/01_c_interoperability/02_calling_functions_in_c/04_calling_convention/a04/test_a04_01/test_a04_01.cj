/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_04_a04_01

  @Level:         1

  @Assertion:    13.1.2.4(4) Example of calling the C standard library function
                 clock as follows:
                    @CallingConv[CDECL]        // Can be omitted in default.
                    foreign func clock(): Int32

                    main() {
                        println(clock())
                    }

  @Description:  The example.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

@CallingConv[CDECL]        // Can be omitted in default. 
foreign func clock(): Int32 

main() {
    println(clock())
}
