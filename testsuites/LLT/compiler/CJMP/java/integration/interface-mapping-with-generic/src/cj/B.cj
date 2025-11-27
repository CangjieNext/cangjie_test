/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cj
 
import interoplib.interop.*
 
public interface B<T, R> {
    func foo(v: T, r: R) : Unit {
        doo(v, r)
        print("CJ: B foo()!\n", flush: true)
    }

    func goo(v:T) : R

    func doo(v:T, r: R) : T
}