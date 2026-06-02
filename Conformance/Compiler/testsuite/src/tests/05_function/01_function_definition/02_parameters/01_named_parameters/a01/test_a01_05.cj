/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a01_05

  @Level:         1

  @Assertion:     5.1.2.1(1) When defining a function, add ! to the end of a parameter name to define the named 
                  parameter. 
    namedParameter 
        : identifier '!' ':' type 
        ;  

  @Description:   Check that function definition with named parameter w/o : and type will produce an error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func f2(a!) {
  a
}

main() {
}
