// LEVEL: 0
// EXEC:%compiler %enableDevirtualization %n.cj %compile_lib_opt
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A {
	public open func Foo() { return 1 }
}

open class B <: A {
	public override func Foo() { return 3 }
}

open class C <: A {
	public override func Foo() { return 4 }
}

open class C1 <: A {
	public override func Foo() { return 5 }
}

open class C2 <: A {
	public override func Foo() { return 6 }
}

open class C3 <: A {
	public override func Foo() { return 7 }
}

main() {
	var a : A = B();
	var i = 0;
	var size = 0
	while (i < 1000000000) {
		let r = a.Foo();
		size  = size + r
		i++;
	}
	0;
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
