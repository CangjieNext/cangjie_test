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
    @!Hide
    func hoo() {}
    @!Hide[isChecked: false]
    func goo() {}
    @!Hide[isChecked: true]
    func koo() {}
}

public class A <: I {
    public func foo() {}
    public func hoo() {} // error
    public func goo() {} // error
    public func koo() {} // error
}

public class B <: I {
    @!Hide
    public func foo() {} // error
    @!Hide
    public func hoo() {}
    @!Hide
    public func goo() {}
    @!Hide
    public func koo() {} // error
}

public class C <: I {
    @!Hide[isChecked: false]
    public func foo() {} // error
    @!Hide[isChecked: false]
    public func hoo() {}
    @!Hide[isChecked: false]
    public func goo() {}
    @!Hide[isChecked: false]
    public func koo() {} // error
}

public class D <: I {
    @!Hide[isChecked: true]
    public func foo() {} // error
    @!Hide[isChecked: true]
    public func hoo() {} // error
    @!Hide[isChecked: true]
    public func goo() {} // error
    @!Hide[isChecked: true]
    public func koo() {}
}

/* SCAN
*/
