// LEVEL: 0
// EXEC:%compiler %enableDevirtualization %n.cj %compile_lib_opt
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A {
	public open func Foo() { return 1 }
}

open class Q <: A {
	public override func Foo() { return 3 }
}

class B <: Q {}
class C <: Q {}

main () {
	var a = A();
	var s = "hello world"
	if (s.size == 11) {
		a = B();
	} else {
		a = Q();
	}

	a.Foo() // Q::Foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
