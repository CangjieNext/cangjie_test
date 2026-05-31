// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f


import java.lang.*

@Java
public open foreign class A {
    public init()
}

@Java
public open foreign class B {
    public init()
}

func genericFunc<T>(): Unit {}

open class X<T> {
    init() {}
    init(x: T) {}

    static func foo(x: T) {}
    static func bar<E>(x: E) {}
}

extend X<B> {}

class Y <: X<B> {}

func test() {
    let a = A()
    let b = B()
    
    let x = X<A>()
    let y = X(a)

    genericFunc<X<A>>()
    
    X.foo(Some(a))
    X<?B>.bar(a)
}

/* SCAN-IN
error: generic type 'X' cannot be instantiated with @Java type 'B'
  ==> generic_instantiate_classes.cj:32:8:
   | 
32 | extend X<B> {}
   |        ^^^^ 
   | 

error: generic type 'X' cannot be instantiated with @Java type 'B'
  ==> generic_instantiate_classes.cj:34:12:
   | 
34 | class Y <: X<B> {}
   |            ^^^^ 
   | 

error: generic type 'init' cannot be instantiated with @Java type 'A'
  ==> generic_instantiate_classes.cj:40:13:
   | 
40 |     let x = X<A>()
   |             ^^^^ 
   | 

error: generic type 'init' cannot be instantiated with @Java type 'A'
  ==> generic_instantiate_classes.cj:41:13:
   | 
41 |     let y = X(a)
   |             ^ 
   | 

error: generic type 'X' cannot be instantiated with @Java type 'A'
  ==> generic_instantiate_classes.cj:43:17:
   | 
43 |     genericFunc<X<A>>()
   |                 ^^^^ 
   | 

error: generic type 'X' cannot be instantiated with @Java type 'A'
  ==> generic_instantiate_classes.cj:45:5:
   | 
45 |     X.foo(Some(a))
   |     ^ 
   | 

error: generic type 'bar' cannot be instantiated with @Java type 'A'
  ==> generic_instantiate_classes.cj:46:5:
   | 
46 |     X<?B>.bar(a)
   |     ^^^^^^^^^ 
   | 

error: generic type 'X' cannot be instantiated with @Java type 'B'
  ==> generic_instantiate_classes.cj:46:5:
   | 
46 |     X<?B>.bar(a)
   |     ^^^^^ 
   | 

8 errors generated, 8 errors printed.
*/
