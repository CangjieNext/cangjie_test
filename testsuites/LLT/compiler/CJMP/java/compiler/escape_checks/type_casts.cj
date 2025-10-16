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

public func foo(x: Any): Any { x }

public func fooGeneric<T>(x: T): Any { x }

public func leakVarInit() {
    let a: Any = A()
}

public func leakTypePattern() {
    let a = A()
    match (a) {
        case a : Any => ()
        case _ => ()
    }
}

// No debug position for desugared 'as'
public func leakAs(): Unit {
    let a = A()
    let x = (a as Any).getOrThrow()
}

public func leakArg(): Unit {
    let a = A()
    let b = 10
    foo(a)
}

public func leakArgGeneric(): Unit {
    let a = A()
    fooGeneric(a)
}

public func leakLca() {
    let x = if (true) {
        A()
    } else {
        let x: Any = 10
        x
    }
}

public func leakLcaMatch() {
    let x = match (10) {
        case 0 => A()
        case 1 => 
            let x: Any = 10
            x
        case _ => throw Exception("GG")
    }
}

public func noLeakLca() {
    let x = if (true) {
        A()
    } else if(true) {
        B()
    }
}

public func implicitCastInLambda() {
    let f = { => 
        let x: Any = A()
    }
}

/* SCAN-IN
error: Illegal type cast from Java type 'A' to non Java type 'Any'
  ==> type_casts.cj:27:5:
   | 
27 |     let a: Any = A()
   |     ^^^^^^^^^^^^^^^^ 
   | 

error: Illegal type cast from Java type 'A' to non Java type 'Any'
  ==> type_casts.cj:33:14:
   | 
33 |         case a : Any => ()
   |              ^ 
   | 

error: Illegal type cast from Java type 'A' to non Java type 'Any'
  ==> type_casts.cj:41:16:
   | 
41 |     let x = (a as Any).getOrThrow()
   |                ^ 
   | 

error: Illegal type cast from Java type 'A' to non Java type 'Any'
  ==> type_casts.cj:47:5:
   | 
47 |     foo(a)
   |     ^^^^^^ 
   | 

error: Illegal type cast from Java type 'A' to non Java type 'Any'
  ==> type_casts.cj:56:13:
   | 
56 |       let x = if (true) {
   |  _____________^
57 | |         A()
   | | ...
61 | |     }
   | |_____^
   | 

error: Illegal type cast from Java type 'A' to non Java type 'Any'
  ==> type_casts.cj:66:19:
   | 
66 |         case 0 => A()
   |                   ^^^ 
   | 

error: Illegal type cast from Java type 'A' to non Java type 'Any'
  ==> type_casts.cj:84:9:
   | 
84 |         let x: Any = A()
   |         ^^^^^^^^^^^^^^^^ 
   | 

7 errors generated, 7 errors printed.
*/
