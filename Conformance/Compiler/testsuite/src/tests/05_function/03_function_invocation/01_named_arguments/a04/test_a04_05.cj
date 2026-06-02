/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_01_a04_05

  @Level:         1

  @Assertion:       5.3.1(4) When a function is invoked, all named parameters must be forwarded using named arguments.
                    Otherwise, an error is reported.

  @Description:     Check that functions with unnamed parameter can't be invoked with forvarding parameter by name

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

func myFunc(a: Int32): Int32 { 
    a + 2
} 

main() {
    myFunc(a: 6)
}
