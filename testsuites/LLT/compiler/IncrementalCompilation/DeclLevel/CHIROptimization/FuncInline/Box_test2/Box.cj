// DEPENDENCE: %n.txt
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output 2>&1 | compare %f
// EXEC-2: %run %run_opt %output %run_args

func foo(): Int64 {
    0
}

interface I {
	func f() { 1 }
}
extend Int64 <: I {
	public func f(): Int64 {
        foo()
	}
}

main() {
	var a : I = 1
	return a.f()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
