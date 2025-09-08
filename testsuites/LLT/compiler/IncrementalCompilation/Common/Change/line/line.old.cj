


func add_func1(a: Int8, b: Int8): Int8 { 
    return a + b 
} 

@C 
func add_func(a: Int8, b: Int8, c: Int8): Unit { 
    add_func1(a + b, b + c) 
} 

unsafe main(): Int64 { 
    add_func(1, 2, 3) 
    return 0 
} 



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
