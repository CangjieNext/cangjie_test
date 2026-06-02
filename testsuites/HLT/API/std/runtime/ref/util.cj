/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
import std.sync.AtomicBool
import std.ref.*

var spin: AtomicBool = AtomicBool(true)

class Date {
    var number: Int64 = 0
    ~init() {
        // let it go
        spin.store(false)
    }
}

func checkAlive<T>(cache: WeakRef<T>): Bool where T <: Object {
    match (cache.value) {
        case Some(x) => true
        case None => false
    }
}

func checkDeath<T>(cache: WeakRef<T>): Bool where T <: Object {
    match (cache.value) {
        case Some(x) => false
        case None => true
    }
}
