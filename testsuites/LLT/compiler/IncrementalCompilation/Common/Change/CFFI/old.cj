internal import std.collection.* 

@C 
func cfoo_0(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 

@C 
func cfoo_1(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 


@C 
func cfoo_2(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 
@C 
func cfoo_3(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 
@C 
func cfoo_4(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 




@C 
func cfoo_5(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 
@C 
func cfoo_6(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 
@C 
public func cfoo_7(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 
@C 
func cfoo_8(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 


@C 
func cfoo_9(a: Bool): CPointer < Unit > { 
    println("cfoo!") 
    return CPointer < Unit >() 
} 


foreign func cast(f: CFunc <(Bool) -> CPointer < Unit >>): CPointer < Unit > 
main(): Int64 { 
    unsafe {
    cast(cfoo_0) 
    cast(cfoo_1) 
    cast(cfoo_2) 
    cast(cfoo_3) 
    cast(cfoo_4) 
    cast(cfoo_5) 
    cast(cfoo_6) 
    cast(cfoo_7) 
    cast(cfoo_8) 
    cast(cfoo_9) 
    }



    return 0 
} 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
