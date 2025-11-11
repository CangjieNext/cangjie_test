/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cj
 
import interoplib.interop.*
 
public interface A {
    func foo(a : Int32) : Unit {
        print("Hello World From CJ!\n", flush: true)
        print("number = ${a}\n", flush: true)
    }
}