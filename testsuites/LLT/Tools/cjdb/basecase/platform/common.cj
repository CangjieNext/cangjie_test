// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

public common func foo(): Unit


public common class A {
	common var a: Int64
    public common A(public common var x: Int64) {}
	public common func foo1():Unit{}
}

public common struct B {
	common var a: Int64
    public common B(public common var x: Int64) {}
	public common func foo1():Unit{}
}

common enum C {
    | cs
    common func foo(): Unit {}
}