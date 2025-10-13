package a

foreign func cast(f: CFunc <(Bool) -> CPointer < Unit >>): CPointer < Unit > 

@C
func foo(a: Bool): CPointer<Unit> {
    println("I'm foo")
	return CPointer<Unit>()
}

public func bar<T>(t: T) where T <: ToString {
    println("bar: ${t}")
    unsafe {
        cast(foo)
        foo(true)
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
