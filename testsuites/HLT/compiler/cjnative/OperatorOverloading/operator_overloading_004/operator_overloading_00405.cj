/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



struct A{
let a : Int32 = 1
}

class C{
let a : Int32 = 1
}

interface I{
let a : Int32 = 1
}

func testa(){
operator func + (inputB:A):Bool{ 
return true
}
return
}


func testb(){
operator func + (inputB:C):Bool{ 
return true
}
return
}

func testc(){
operator func + (inputB:I):Bool{ 
return true
}
return
}

class B <: I{}

main():Int64{
let a = A()
let b = B()
let c = C()
return 1
}
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_illegal_modifier_in_scope
