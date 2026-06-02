/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        11_01_03_05_a10_02

  @Level:         1

  @Assertion:   11.1.3.5(10)
    package pkg1 
    public func auxTestA1003(a: Int8) {}      // f1 
    public func auxTestA1003(a: Int16) {}     // f2 

    package pkg2 
    public func auxTestA1003(a: Int32) {}     // f3 
    public func auxTestA1003(a: Int64) {}     // f4 

    package pkg3 
    public class auxTestA1003 {} 

    package pkg4 
    import pkg1.auxTestA1003                    // Shadow 
    import pkg2.auxTestA1003                    // Shadow 
    import pkg3.auxTestA1003                    // Shadow 

    func auxTestA1003(a: UInt64) {}             // f5 

    main(): Int64 { 
        let a: Int32 = 1 
        pkg1.auxTestA1003(a)                   // Error, overloading resolution is made in collection {f1, f2} of  pkg1 
        pkg2.auxTestA1003(a)                 // OK, overloading resolution is made in collection {f3, f4} of pkg2 
        auxTestA1003(a)                       // Error, overloading resolution is made in collection {f1, f2, f3, f4, f5} 
        return 0 
    } 


  @Description:  Check that code sample

  @Mode:         compileonly

  @Negative:     yes

  @CompileWarning:  yes

  @Structure:    complex-main

  @Dependencies: aux_test_a10_01.cj aux_test_a10_02.cj aux_test_a10_03.cj

 */

package pkg4 
import pkg1.auxTestA1003                    // Shadow 
import pkg2.auxTestA1003                    // Shadow 
import pkg3.auxTestA1003                    // Shadow 
import pkg1

func auxTestA1003(a: UInt64) {}             // f5 


main(): Int64 { 
    let a: Int32 = 1 
    pkg1.auxTestA1003(a)                 // Error, overloading resolution is made in collection {f1, f2} of  pkg1 
    return 0 
} 
