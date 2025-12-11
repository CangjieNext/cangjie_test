// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: hide.cj hide_use1.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt hide.cj -o hide.%middle
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt hide.%middle %n.cj -o %n.%suffix -Woff all

package ohos.dep

import ohos.labels.*

public interface I {
    func foo() {}
    func goo() {}
    func koo() {}
}

public class B {}

@!Hide[isChecked: false]
extend B <: I {
    public func foo() {}
    public func goo() {}
    public func koo() {}
}

/* SCAN
error: should be marked with '@!Hide' to be hidden
  ==> override_by_hide4.cj:16:5:
   | 
16 |     func foo() {}
   |     ^^^^^^^^^^^^^ 
   | 

error: should be marked with '@!Hide' to be hidden
  ==> override_by_hide4.cj:17:5:
   | 
17 |     func goo() {}
   |     ^^^^^^^^^^^^^ 
   | 

error: should be marked with '@!Hide' to be hidden
  ==> override_by_hide4.cj:18:5:
   | 
18 |     func koo() {}
   |     ^^^^^^^^^^^^^ 
   | 

3 errors generated, 3 errors printed.
*/
