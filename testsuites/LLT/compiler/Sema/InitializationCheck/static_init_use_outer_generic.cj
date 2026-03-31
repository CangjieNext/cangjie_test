// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

public func foo<T>(): Unit {}

public class Foo<T> {
    static init() {
        foo<T>()
    }
}

main() {}

/* SCAN
error: static member cannot depend on generic parameter 'Generics-T'
  ==> static_init_use_outer_generic.cj:13:13:
   | 
13 |         foo<T>()
   |             ^ 
   | 
note: generic argument declaration here
  ==> static_init_use_outer_generic.cj:11:18:
   | 
11 | public class Foo<T> {
   |                  ^ 
   | 

1 error generated, 1 error printed.
*/
