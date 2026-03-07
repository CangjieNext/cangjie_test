/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cj
 
import interoplib.interop.*
 
public interface A<T> {
    func foo(v:T) : T {
        goo(v)
        print("CJ: A foo()!\n", flush: true)
        return v
    }

    func goo(v:T) : Unit

    func doo(v:T) : T

    func koo(v:Int32) : Int32
}