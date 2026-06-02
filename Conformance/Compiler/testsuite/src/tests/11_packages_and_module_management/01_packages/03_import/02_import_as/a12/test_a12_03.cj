/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a12_03

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
      internal import p1.f1 as foo3       // foo3 is internal.
      protected import p1.f2 as foo4       // foo4 is protected.

      // c.cj 
      package p3 
      import p2.foo       // Error, name foo is not exported by package p2. 
      import p2.foo2      // OK, name foo2 is exported by package p2. 
      import p2.foo3       // Error, name foo3 is not exported by package p2. 
      import p2.foo4       // Error, name foo4 is not exported by package p2. 

      main() { 
        foo()        // Error 
          foo2()          // OK 
        foo3()        // Error
        foo4()        // Error
      } 
    
  @Description:  Check code sample

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: b.cj
 
*/

// c.cj 
package p3 
import p2.foo3       // Error, name foo3 is not exported by package p2. 

main() { 
    foo3()        // Error 
} 