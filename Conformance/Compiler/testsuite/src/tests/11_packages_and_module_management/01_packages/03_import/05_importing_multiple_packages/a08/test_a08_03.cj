/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a08_03

  @Level:         1

  @Assertion:    11.1.3.5(8)
                 // module m1 
                 package pkg1 
                 class AuxTestA0501() 

                 // module m2 
                 package pkg1 
                 class AuxTestA0501 {} 

                 // module m3 
                 import m1.pkg1.AuxTestA0501          // OK 
                 import m2.pkg1.AuxTestA0501          // OK 

                 var a = AuxTestA0501()                    // Error 
                 var b = pkg1.AuxTestA0501()               // Error 
                 var c = m2.pkg1.AuxTestA0501()            // OK 

  @Description:  Check that code sample /

  @Mode:         compileonly

  @Negative:     yes
  
  @Structure:    complex-main

  @Dependencies: aux_test_a08_02.cj aux_test_a08_01.cj

  @Module:       m3

  @Issue:        0006223

 */

// module m3
import m1.pkg1.AuxTestA0801          // OK 
import m2.pkg1.AuxTestA0801          // OK 

main() {
    var b = pkg1.AuxTestA0801()               // Error 
}