
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a12_08

  @Level:         1

  @Assertion:    11.2(12) 
    open class A {} 
    public func foo(a:A) {A()} // error, external declaration use internal types 
    public func foo<T>() where T <: A {0} // error, external declaration use internal types 
    public type B = A // error, external declaration use internal types 
    public let (a, b, c) = (A(), 1, 2) // error, external declaration use internal types 
    public C <: A { // error, external declaration use internal types 
    public: 
         func foo(a:A) {A()} // error, external declaration use internal types 
    protected: 
         func foo(a:A\00 b:A) {} // error, external declaration use internal types 
    private: 
         func foo() {A()} 
    } 
 
  @Description:  Check code sample

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
*/

open class A {} 
public class TestA1208 {
    protected func foo(a:A\00 b:A) {} // error, external declaration use internal types 
}

main() {
    return 0
}