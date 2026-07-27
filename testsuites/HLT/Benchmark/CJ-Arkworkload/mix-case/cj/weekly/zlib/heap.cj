/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.math.*

class PopObject {
    var index: Int64
    var value: Int64
    var length: Int64

    init(index: Int64, value: Int64, length: Int64) {
        this.index = index
        this.value = value
        this.length = length
    }
}

class Heap {
    var buffer: Array<UInt16>
    var length: Int64

    init(length: Int64) {
        this.buffer = Array<UInt16>(length * 2, repeat:0);
        this.length = 0
    }

    func getParent(index: Int64) : Int64 {
        return ((index - 2)/4 | 0) * 2
    }

    func getChild(index: Int64) : Int64 {
        return 2 * index + 2
    }

    func push(index: Int64, value: Int64) : Int64 {
        var current:Int64 = this.length
        var parent:Int64
        var heap: Array<UInt16> = buffer
        var swap: UInt16

        heap[this.length] = UInt16(value)
        heap[this.length + 1] = UInt16(index)
        this.length += 2

        while (current > 0) {
            parent = this.getParent(current)

            if (heap[current] > heap[parent]) {
                swap = heap[current]
                heap[current] = heap[parent]
                heap[parent] = swap

                swap = heap[current + 1]
                heap[current + 1] = heap[parent + 1]
                heap[parent + 1] = swap

                current = parent
            } else {
                break
            }
        }
        return this.length
    }

    func pop() :PopObject {
        var index:Int64 = 0
        var value:Int64 = 0
        var swap: UInt16 = 0
        var current:Int64 = 0
        var parent: Int64 = 0
        var heap:Array<UInt16> = this.buffer

        value = Int64(heap[0])
        index = Int64(heap[1])

        this.length -= 2
        heap[0] = heap[this.length]
        heap[1] = heap[this.length + 1]

        parent = 0
        while (true) {
            current = this.getChild(parent)

            if (current >= this.length) {
                break
            }

            if (current + 2 < this.length && heap[current + 2] > heap[current]) {
                current += 2
            }

            if (heap[current] > heap[parent]) {
                swap = heap[parent]
                heap[parent] = heap[current]
                heap[current] = UInt16(swap)

                swap = heap[parent + 1]
                heap[parent + 1] = heap[current + 1]
                heap[current + 1] = swap
            } else {
                break
            }

            parent = current
        }

        return PopObject(index, value, this.length)
    }
}

