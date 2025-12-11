// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: hide.cj call_hide_extend_dep.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt hide.cj -o hide.%middle
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt hide.%middle %n.cj -o %n.%suffix -Woff all

package dep

import ohos.labels.*

public class A {
    @!Hide[isChecking: true]
    public A(@!Hide[isChecking: true] public var a!: Int64 = 1, public var b!: Int64 = 2) {}

    public init() {
        a = 3
        b = 4
    }

    // @!Hide[isChecking: true]
    // public var a: Int64

    // public var b: Int64

    public func foo(@!Hide[isChecking: true] c: Int64) {
        c
    }
}

/* SCAN
error: undeclared identifier 'a'
  ==> call_hide_param_dep.cj:20:9:
   | 
20 |         a = 3
   |         ^ 
   | 
   # note: the referenced declaration is hidden by 'Hide' annotation

error: undeclared identifier 'c'
  ==> call_hide_param_dep.cj:30:9:
   | 
30 |         c
   |         ^ 
   | 
   # note: the referenced declaration is hidden by 'Hide' annotation

2 errors generated, 2 errors printed.
*/
