/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a08_01

  @Level:         1

  @Assertion:       5.7.1(8) In the following example, function overloading occurs at the top level since there are 
                    two functions named f but with different parameter types. 
                    // f overloading 
                    func f() {...} 
                    func f(a: Int32) {...}

  @Description:     Positive examples from spec

  @Mode:            compileonly

  @Negative:        no

  @Structure:       single

*/

func f() {}
func f(a: Int32) {}

main() {
}
