/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
macro package test

import std.ast.*
import std.process.*
import std.fs.*
import std.runtime.*

func print_mem_info() {
    println("MemoryInfo.maxHeapSize        = ${MemoryInfo.maxHeapSize}")
    println("MemoryInfo.allocatedHeapSize  = ${MemoryInfo.allocatedHeapSize}")
    var res = "MemoryInfo.allocatedHeapSize  = ${MemoryInfo.allocatedHeapSize}\n"
    println("MemoryInfo.heapPhysicalMemory = ${MemoryInfo.heapPhysicalMemory}")
}

public macro M(a: Tokens) {
    print_mem_info()
    println("${Process.current.arguments}")
    return a
}
