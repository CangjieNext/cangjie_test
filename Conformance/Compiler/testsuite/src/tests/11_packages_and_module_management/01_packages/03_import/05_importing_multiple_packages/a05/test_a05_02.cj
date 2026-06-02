/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a05_02

  @Level:         1

  @Assertion:    11.1.3.5(5)
                 package p1 
                 public class C {} 

                 package p2 
                 public class C {} 

                 package p3 
                 import p1.*           // OK 
                 import p2.*           // OK 

                 main(): Int64 { 
                     let a = C()              // Error, can not distinguish which class C is used. 
                     let b = p1.C()           // OK, class C in package p1 is used. 
                     let c = p2.C()           // OK, class C in package p1 is used. 
                 } 

                 package p4 
                 import p1.C, p1.Add // OK 
                 import p2.C, p2.Add // OK 

                 main(): Int64 { 
                     let a = C()              // Error, can not distinguish which class C is used. 
                     let b = p1.C()           // OK, class C in package p1 is used. 
                     let c = p2.C()           // OK, class C in package p2 is used. 
                 } 

  @Description:  Check that code sample

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a05_01.cj aux_test_a05_02.cj

*/

package p3 
import p1.*           // OK 
import p2.*           // OK 

main(): Int64 { 
    let a = C()              // Error, can not distinguish which class C is used.
    return 0 
} 