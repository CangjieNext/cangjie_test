/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/**
 * Adds two integers.
 * @param a first operand
 * @param b second operand
 * @return the sum
 */
func add(a: Int64, b: Int64): Int64 {
    return a + b
}

/**
 * A counter box.
 * @since 1.0
 */
class Box {
    private var v: Int64 = 0
    public init() {
    }

    /**
     * Increases counter by one.
     * Nested example:
     *   let r = add(1, 2)
     * @return the new value
     */
    public func inc(): Int64 {
        v = v + 1
        return v
    }

    // plain line note
    public func peek(): Int64 {
        return v
    }
}

/**
 * entry point
 */
main() {
    let b = Box()
    println("${add(1, 2)}")
    println("${b.inc()}")
    println("${b.peek()}")
}
