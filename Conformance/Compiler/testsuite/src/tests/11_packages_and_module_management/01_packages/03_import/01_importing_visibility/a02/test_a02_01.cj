/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         11_01_03_01_a02_01

  @Level:         1

   @Assertion:    11.1.3.1(2)     
    package p1 
    public class C {} 

    public interface Add<T> { 
         func add(other: T): T  
    } 

    extend Int64 <: Add<Int64> { 
        public func add(other: Int64): Int64 { 
             return this + other 
        } 
    } 

    // file1 in package p2 
    package p2 
    import p1.C 
    import p1.Add 
    interface Minus<T> { 
        func minus(other: T): T 
    } 
    extend Int64 <: Minus<Int64> { 
        public func minus(other: Int64): Int64 { 
             return this - other 
        } 
    } 
    func Foo() { 
        var obj = C()      // OK, the imported class C is visible to all files of current package. 
        1.add(2)           // OK, the imported extend declaration is visible to all files of current  package. 
        2.minus(1)         // OK, the extend declaration is visible to all files of current package. 
    } 

    // file2 in package p2 
    package p2 
    func Bar() { 
        var obj2 = C()     // OK, the imported class C is visible to all files of current package. 
        1.add(2)           // OK, the imported extend declaration is visible to all files of current  package. 
        2.minus(1)         // OK, the extend declaration is visible to all files of current package. 
    } 

   @Description:  Check code sample

   @Mode:         compileonly

   @Negative:     no

   @Structure:    complex-main

   @Dependencies: aux_test_a02_01.cj aux_test_a02_02.cj aux_test_a02_03.cj

 */

package p2

main() {
    Foo()
    Bar()
    return 0
}