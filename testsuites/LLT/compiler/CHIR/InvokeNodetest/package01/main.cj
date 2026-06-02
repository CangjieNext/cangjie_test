// LEVEL: 0
// DEPENDENCE: base.cj
// EXEC:%compiler base.cj %compile_lib_opt -o base.%middle
// EXEC:%compiler %enableDevirtualization base.%middle main.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import test.*

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
    return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
