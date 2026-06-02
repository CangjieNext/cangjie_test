/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


interface A<X>{}
interface A2 <: A<<Int32>>{} 
class B<X> <: A<X>{}
class C <: A<<Int32>>{} 
main(){
var i : A<<Int32>> = B<<Int32>>() 
var j : A<<Int32>> = C() 
var k : A2
return 0
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_character
