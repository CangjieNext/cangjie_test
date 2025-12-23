/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

@ObjCImpl
public class A <: M {
    public init() {
    }
    public open func foo(): Unit {
        println("in cangjie foo")
        let m = M()
    }
    public func f0(f: ObjCBlock<() -> Unit>): Unit {
        f.call()
        let ff = ObjCBlock<() -> Unit>({=> println("cj lambda")})
        let m = M()
        // m.processWithCompletion(f)
    }
    public func getCJBlock(): ObjCBlock<() -> Unit> {
        let ff = ObjCBlock<() -> Unit>({=> println("cj lambda")})
        println("in getCJBlock")
        ff.call()
        ff
    }
}
