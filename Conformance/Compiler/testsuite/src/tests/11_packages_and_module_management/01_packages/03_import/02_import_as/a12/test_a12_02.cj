/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a12_02

  @Level:         1

  @Assertion:    11.1.3.2(12) 
      // a.cj 
      package p1 
      public func f1(){} 
      public func f2(){} 

      // b.cj 
      package p2 
      import p1.f1 as foo      // foo is private in current file. 
      public import p1.f2 as foo2       // foo2 is public. 

      // c.cj 
      package p3 
      import p2.foo       // Error, name foo is not exported by package p2. 
      import p2.foo2      // OK, name foo2 is exported by package p2. 

      main() { 
        foo()        // Error 
          foo2()          // OK 
      } 
    
  @Description:  Check code sample

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: b.cj
 
*/

// c.cj 
package p3 
import p2.foo       // Error, name foo is not exported by package p2. 

main() { 
    foo()        // Error 
} 