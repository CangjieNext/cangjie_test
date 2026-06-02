/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

/*
"extend C <" and "extend Int32 <" error message is different bacause of compiler architecture, 
error message is given at Parser phase when compiler dont know C is Int32. so C may have type parameter.
*/
type C = Int32
extend C < 
	func plus(a: Int32): Int32 { 0 }  
>
    
main(): Int64 {
    return 0
}
// ASSERT: scan parse_expected_type
// ASSERT: scan parse_expected_decl
