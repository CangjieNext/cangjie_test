/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I<X,Y>{
func t<X>(a:X,b:Y):Y{b} 
}

class A <: I<Int32 &Int32> {
var a :Int32 = 1
var b = t<Int32>(a,a)
}

main(){
A()
return 0
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_invalid_super_declaration
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_decl
