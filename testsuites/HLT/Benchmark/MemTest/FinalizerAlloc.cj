/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.memory

import std.collection.*
import std.random.*
import std.math.*
import std.time.*
import std.runtime.*
import std.sync.*

var alloc_in_finalizer = 100

public var FinalizerAllocated = AllocUnit()

public class FinalizerAllocUnitGlobal{
    ~init(){
        FinalizerAllocated = AllocUnit(alloc_in_finalizer)
    }
}


public class FinalizerAllocUnit <: AllocUnit{
    init(x:Int64){super(x)}
    ~init(){
        var alloc_array : Array<Int8> = Array<Int8>(alloc_in_finalizer,repeat:Int8(1))
    }
}
