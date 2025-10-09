foreign func PassPointerToCangjie(): CPointer<IntNative>
interface I {
    func f(): Unit
}
struct A <: I {
    var a: CPointer<IntNative> = unsafe { PassPointerToCangjie() }
    var b: CPointer<IntNative> = CPointer<IntNative>(a)
    public func f(): Unit {
        println("hello")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
