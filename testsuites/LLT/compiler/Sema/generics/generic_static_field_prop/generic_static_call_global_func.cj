// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %frontendCompiler %typecheck %cmp_opt %f

public func foo<T>(): Unit { }

class Foo<T> {
    static init() {
        foo<T>()
    }
}

main(): Unit {}

/* SCAN
error: static member cannot depend on generic parameter 'Generics-T'
  ==> generic_static_call_global_func.cj:13:13:
   | 
13 |         foo<T>()
   |             ^ 
   | 
note: generic argument declaration here
  ==> generic_static_call_global_func.cj:11:11:
   | 
11 | class Foo<T> {
   |           ^ 
   | 

1 error generated, 1 error printed.
*/