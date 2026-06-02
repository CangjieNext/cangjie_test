/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f



struct Data {
var b: Float32
	Data(abstract var a: Int32)  { 
		this.a = a
		b = 2.0
	}
}

func run(): Int64 {
	var value : Data = Data(1);
	if ((value.a == 1) &&  (value.b == 2.0)) {
		return 0
	}
	else {
		return 1
	}
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_illegal_modifier_in_scope
