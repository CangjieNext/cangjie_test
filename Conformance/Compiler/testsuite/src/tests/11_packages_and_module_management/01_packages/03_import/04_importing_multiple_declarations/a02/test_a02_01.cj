/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_03_04_a02_01

  @Level:         1

  @Assertion:    11.1.3.4(2)
                  package p1 
                  public class AuxTestA0201 {} 
                  public func f() : Unit {} 

                  package p2 

                  // first way 
                  import p1.AuxTestA0201 as C1 
                  import p1.f as f1 


                  package p3
                  // second way 
                  import p1.AuxTestA0201 as C1, 
                        p1.f as f1 

                  package p4 
                  // third way 
                  import p1.{AuxTestA0201 as C1, 
                              f as f1} 

   @Description:  Check that code sample

   @Mode:         compileonly

   @Negative:     no

   @Structure:    complex-main

   @Dependencies: aux_test_a02_01.cj

 */

package p2 

// first way 
import p1.AuxTestA0201 as C1 
import p1.f as f1

main() {
    return 0
}

