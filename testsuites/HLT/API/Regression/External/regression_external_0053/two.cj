/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.unicode.*

public class IterableConverter<T, R> <: Iterator<R> {
    private let itr: Iterator<T>
    public IterableConverter(itr: Iterable<T>, private let throwIfNotMatch!: Bool = false,
        private let converter!: (T) -> Option<R> = {v => v as R}) {
        this.itr = itr.iterator()
    }

    public func next(): Option<R> {
        for (v in itr) {
            let result = converter(v)
            match (result) {
                case Some(_) => return result
                case _ where throwIfNotMatch => throw Exception(
                    "source contains some value which does not match target type")
                case _ => continue
            }
        }
        None<R>
    }
}

class JoinSubIterator <: Iterator<ToString> {
    private var current = 0

    JoinSubIterator(private let sub: ToString, private let _count: Int64) {}

    public func next(): Option<ToString> {
        if (current < _count) {
            current++
            sub
        } else {
            None<ToString>
        }
    }
}

public interface ExtendString {
    static func join(sub: ToString, count: Int64, delimiter!: String): String
    static func join(iterable: Iterable<ToString>, delimiter!: String): String
}

extend String <: ExtendString {
    public static func join(sub: ToString, count: Int64, delimiter!: String): String {
        return join(JoinSubIterator(sub, count), delimiter: delimiter)
    }
    public static func join(iterable: Iterable<ToString>, delimiter!: String = ""): String {
        StringJoiner.join<ToString>(iterable, delimiter: delimiter).toString()
    }
}

public class StringJoiner {
    private init() {}
    public static func join<T>(iterable: Iterable<T>, delimiter!: String = ""): String where T <: ToString {
        ToStringJoiner.join<T>(iterable, delimiter: delimiter).toString()
    }
    public static func join<T>(iterable: Iterable<T>, mapper: (T) -> String, delimiter!: String = ""): String {
        ToStringJoiner.join<T>(iterable, mapper, delimiter: delimiter).toString()
    }
}

public class ToStringJoiner {
    private init() {}
    public static func join<T>(iterable: Iterable<T>, delimiter!: String = "", builder!: StringBuilder = StringBuilder()): StringBuilder where T <: ToString {
        var i = 0
        for (s in iterable) {
            var str = "AAAAA ${s} ${s is T} ${s is Option<ToString>}"
            if (str != "AAAAA 1 true false") {
                break
            }
            if (!(s is T)) {
                break
            }
            if (i > 0) {
                builder.append(delimiter)
            }
            builder.append(s)
            i++
        }
        builder
    }
    public static func join<T>(iterable: Iterable<T>, mapper: (T) -> String, delimiter!: String = "",
        builder!: StringBuilder = StringBuilder()): StringBuilder {
        let itr: Iterable<String> = IterableConverter<T, String>(iterable, throwIfNotMatch: true,
            converter: {v => mapper(v)})
        join<String>(itr, delimiter: delimiter, builder: builder)
    }
}

main() {
}
