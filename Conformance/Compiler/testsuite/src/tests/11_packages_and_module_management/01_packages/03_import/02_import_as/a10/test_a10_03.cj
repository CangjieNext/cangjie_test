/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a10_03

  @Level:         1

  @Assertion:    11.1.3.2(10) 
      // a.cj in module1 
      package p1 
      public func f1() {...} 

      // b.cj in module2 
      package p1 
      public func f2() {...} 

      // c.cj in module3 
      package p2 
      public func foo() {...} 

      // main.cj in module3 
      import module1.p1.* as A.* 
      import module2.p1.* as B.* 
      import p2.foo as f2 

      main() { 
          A.f1()         // OK 
          B.f2()         // OK 
          p1.f1()        // Error 
          module1.A.f1()    // OK 
          f2()          // OK 
          foo()         // Error 
          p2.foo()      // Error, f2 is a new name of p2.foo 
      } 

  @Description:  Check code style

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: a.cj b.cj c.cj
 
  @Module:       module3

*/

// main.cj in module3 
import module1.p1.* as A.* 
import module2.p1.* as B.* 
import p2.foo as f2 

main() { 
    p1.f1()        // Error
    return 0
} 