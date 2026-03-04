// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.*

public enum GenericEnum<T> where T <: ToString {
    | Red(T) | Green(T) | Blue(T)

    public func printValue(): Unit {
        let s = match (this) {
            case Red(n) => "red(${n})"
            case Green(n) => "green(${n})"
            case Blue(n) => "blue(${n})"
        }
        print("cangjie: ${s}\n", flush: true)
    }

    public func setValue(a: T): T {
        print("cangjie: ${a}\n", flush: true)
        a
    }

    public prop value: T {
        get() {
            match (this) {
                case Red(n) => n
                case Green(n) => n
                case Blue(n) => n
            }
        }
    }
}
