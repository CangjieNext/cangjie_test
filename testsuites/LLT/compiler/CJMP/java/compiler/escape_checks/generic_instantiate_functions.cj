// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.*

@JavaMirror
public open class A {
    public init()
}

@JavaMirror
public open class B {
    public init()
}

func genericFunc<T>(): Unit {}
func genericFuncParam<T>(x: T): Unit {}

class C {
    static func foo<T>(x: T): Unit {}
    func bar<T, E>(x: E, y: T): Unit {}
}

func test() {
    let a = A()
    let b = B()
    
    genericFunc<A>()
    genericFunc<Option<A>>()
    genericFuncParam(a)
    genericFuncParam(Some(a))
    
    C.foo<B>(b)
    C().bar(Some(b), a)

    let args = JArray<A>(10)
}

/* SCAN-IN
error: Can not instantiate generic 'genericFunc' with java interoperability type 'A'
  ==> generic_instantiate_functions.cj:34:5:
   | 
34 |     genericFunc<A>()
   |     ^^^^^^^^^^^^^^ 
   | 

error: Can not instantiate generic 'genericFunc' with java interoperability type 'A'
  ==> generic_instantiate_functions.cj:35:5:
   | 
35 |     genericFunc<Option<A>>()
   |     ^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: Can not instantiate generic 'genericFuncParam' with java interoperability type 'A'
  ==> generic_instantiate_functions.cj:36:5:
   | 
36 |     genericFuncParam(a)
   |     ^^^^^^^^^^^^^^^^ 
   | 

error: Can not instantiate generic 'genericFuncParam' with java interoperability type 'A'
  ==> generic_instantiate_functions.cj:37:5:
   | 
37 |     genericFuncParam(Some(a))
   |     ^^^^^^^^^^^^^^^^ 
   | 

error: Can not instantiate generic 'foo' with java interoperability type 'B'
  ==> generic_instantiate_functions.cj:39:5:
   | 
39 |     C.foo<B>(b)
   |     ^^^^^^^ 
   | 

error: Can not instantiate generic 'bar' with java interoperability type 'B'
  ==> generic_instantiate_functions.cj:40:5:
   | 
40 |     C().bar(Some(b), a)
   |     ^^^^^^^ 
   | 
   # note: Also uses java interoperability type 'A'

6 errors generated, 6 errors printed.
*/
