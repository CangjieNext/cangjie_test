/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a04_01

  @Level:         1

  @Assertion:    11.1.3.6(4) 
    // pkg1 
    package pkg1 
    public interface Num<T> { 
        func add(other: T): T 
    } 
    extend Int32 <: Num<Int32> { 
        func add(other: Int32) { 
             this + other 
         } 
    } 

    public var a : Int32 = 1 
    public class C {} 

    // pkg2 
    package pkg2 
    public import pkg1.Num 
    import pkg1.a 
    public import pkg1.C 

    // pkg3 
    package pkg3 
    import pkg2.* 
    main(): Int64 { 
         1.add(2)                        // OK, interface Num is re-exported by pkg2. 
        var b = a                        // error, a is not re-exported by pkg2. 
        var c = C()                      // OK, C is re-exported by pkg2. 
         return 0 
    } 

  @Description:  Check that code sample

  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a04_02.cj

 */

// pkg3 
package pkg3 
import pkg2.* 
main(): Int64 { 
    1.add(2)                        // OK, interface Num is re-exported by pkg2. 
    var c = C()                      // OK, C is re-exported by pkg2. 
    return 0 
} 