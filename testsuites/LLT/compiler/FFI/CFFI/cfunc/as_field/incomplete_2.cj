// ERRCHECK: %compiler %cmp_opt %f -o %output

var cnt = 0

@C
struct A {
    var n = 0
    var f: CFunc<() -> A> = { =>
        var a = A()
        a.n = cnt
        cnt++
        println("default impl in A, a.n = ${a.n}")
        return a
    }
}

@C
func foo(): A {
    var a = A()
    a.n = cnt
    cnt++
    println("foo(), a.n = ${a.n}")
    return a
}

unsafe main() {
    var a = A()
    a = a.f()

    var f: CFunc<() -> A> = { =>
        var a = A()
        a.n = cnt
        cnt++
        println("f in main(), a.n = ${a.n}")
        return a
    }
    a.f = f
    a = a.f()

    a.f = foo
    a = a.f()
    0
}

/* SCAN
error: recursive constructor calling detected
 ==> incomplete_2.cj:9:17:
  | 
9 |         var a = A()
  |                 ^ 
  | 
note: depends on
 ==> incomplete_2.cj:6:8:
  | 
6 | struct A {
  |        ^ 
  | 
note: depends on
 ==> incomplete_2.cj:9:17:
  | 
9 |         var a = A()
  |                 ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
