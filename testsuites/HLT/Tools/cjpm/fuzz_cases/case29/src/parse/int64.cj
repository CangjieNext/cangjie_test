/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package demo.parse

internal import std.convert.*

public interface ParsableBy<T> {
    /**
     * @Description Provides an abstract function to support specific types of parsing from strings by base.
     *
     * @param value of String.
     * @return Parameters of T.
     *
     * @since 0.31.4
     */
    static func parseBy(value: String, base!: Int64): T

    /**
     * @Description Provides an abstract function to support specific types of parsing from strings by base.
     *
     * @param value of String.
     * @return Parameters of Option<T>.
     *
     * @since 0.31.4
     */
    static func tryParseBy(value: String, base!: Int64): Option<T>
}

extend Int64 <: ParsableBy<Int64> {
    public static func parseBy(value: String, base!: Int64 = 10): Int64 {
        match (base) {
            case 2 =>
                if (value.startsWith("0b") || value.startsWith("0B")) {
                    return Int64.parse(value)
                } else {
                    return Int64.parse("0b" + value)
                }
            case 8 =>
                if (value.startsWith("0o") || value.startsWith("0O")) {
                    return Int64.parse(value)
                } else {
                    return Int64.parse("0o" + value)
                }
            case 10 => return Int64.parse(value)
            case 16 =>
                if (value.startsWith("0x") || value.startsWith("0X")) {
                    return Int64.parse(value)
                } else {
                    return Int64.parse("0x" + value)
                }
            case _ => throw IllegalArgumentException(
                "Do not support ${base} numeration now ! Please input one of [2,8,10,16] for base!")
        }
    }

    public static func tryParseBy(value: String, base!: Int64 = 10): Option<Int64> {
        match (base) {
            case 2 =>
                if (value.startsWith("0b") || value.startsWith("0B")) {
                    return Int64.parse(value)
                } else {
                    return Int64.parse("0b" + value)
                }
            case 8 =>
                if (value.startsWith("0o") || value.startsWith("0O")) {
                    return Int64.parse(value)
                } else {
                    return Int64.parse("0o" + value)
                }
            case 10 => return Int64.parse(value)
            case 16 =>
                if (value.startsWith("0x") || value.startsWith("0X")) {
                    return Int64.parse(value)
                } else {
                    return Int64.parse("0x" + value)
                }
            case _ =>
                println("Do not support ${base} numeration now ! Please input one of [2,8,10,16] for base!");
                return None
        }
    }
}
