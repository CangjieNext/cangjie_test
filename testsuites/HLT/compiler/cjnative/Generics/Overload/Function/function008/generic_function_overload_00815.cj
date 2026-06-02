/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output




interface A<T> {
func test(a:T,b!:Int64=1){}
}
interface B<T> <: A<T>{
func test(a:T){}
var x : T
func i(){
var I = test(x) 
return I
}
}

main():Int64{
return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
