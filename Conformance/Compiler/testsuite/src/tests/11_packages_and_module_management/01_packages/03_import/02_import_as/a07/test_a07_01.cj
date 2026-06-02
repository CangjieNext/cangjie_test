/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a07_01

  @Level:         1

  @Assertion:    11.1.3.2(7)       
      // a.cj 
      package p1 
      public func f1() {...} 

      // b.cj 
      package p2 
      public func f2(a: String) {...} 

      import p1.f1 as f // Ok, overloaded. 
      import p2.f2 as f // Ok, overloaded. 

      func f(a: Int32) {}     // Ok, overloaded. 

      main() { 
        f(1)     // Ok, invoke 'f' defined in b.cj. 
        return 0 
      } 
 
  @Description:  Check code sample

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @CompileWarning:  yes

  @Dependencies: a.cj b.cj
 
  @Issue:        0006215

*/


import p1.f1 as f // Ok, overloaded. 
import p2.f2 as f // Ok, overloaded.

func f(a: Int32) {
    "${a}"
}     // Ok, overloaded. 

main() { 
    f(1)     // Ok, invoke 'f' defined in b.cj.
    return 0 
}