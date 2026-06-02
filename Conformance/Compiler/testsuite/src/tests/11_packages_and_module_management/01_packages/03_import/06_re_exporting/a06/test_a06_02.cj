/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a06_02

  @Level:         1

  @Assertion:    11.1.3.6(6) The situation where re-exports are required is when the imported type appears
                 in the parameter type or return value type of a function that has public semantics
                 in the current package. 

  @Description:  Check that compiler throws an error when invoking the function f1 from pkga3 which return 
                 value type wasn't re-exported to p1 

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a06_03.cj

  @Issue:        0006248
*/

package p2
import pkga3.f1

main() { 
    var obj = f1() //imported type E1 appears in return value
    return 0 
} 