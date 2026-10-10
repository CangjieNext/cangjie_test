/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

public class SimpleClass {
    public init() {
        this.name = "default"
    }
    public var name: String = ""

    public var value: Int64 = 0i64
}

public class HelperClass {
    public init() {
    }
}

public struct HelperStruct {
    public var x: Int64 = 0i64

    public init() {
    }
}

public class MultiCtorClass {
    public var name: String = ""

    public var length: Int64 = 0i64

    public var width: Int64 = 0i64

    public var flag: Bool = false

    public init() {
    }
    public init(name: String) {
        this.name = name
    }
    public init(name: String, length: Int64, width: Int64) {
        this.name = name
        this.length = length
        this.width = width
    }
    public init(name: String, length: Int64, width: Int64, flag: Bool) {
        this.name = name
        this.length = length
        this.width = width
        this.flag = flag
    }
}

public class RichMemberClass {
    public var counter: Int64 = 0i64

    public let label: String = "default"

    public func increment(): Int64 {
        this.counter = counter + 1i64
        counter
    }

    public func add(n: Int64): Int64 {
        this.counter = counter + n
        counter
    }

    public static var instanceCount: Int64 = 0i64

    public static let className: String = "RichMemberClass"

    public static prop config: String {
        get() {
            "default-config"
        }
    }

    public static mut prop propCounter: Int64 {
        get() {
            0i64
        }
        set(v) {
        }
    }

    public static func create(): RichMemberClass {
        return RichMemberClass()
    }

    public prop info: String {
        get() {
            "RichMemberClass instance"
        }
    }

    private var _score: Int64 = 100i64

    public mut prop score: Int64 {
        get() {
            this._score
        }
        set(v) {
            this._score = v
        }
    }

    public init() {
    }
}

public open class Animal {
    public var name: String = ""

    public init() {
    }
    public init(name: String) {
        this.name = name
    }
}

public abstract class Shape {
    public init() {
    }
}

public class Circle <: Shape {
    public var radius: Float64 = 1.000000f64

    public init() {
        super()
    }
}

public class Rectangle <: Shape {
    public var length: Float64 = 1.000000f64

    public var width: Float64 = 1.000000f64

    public init() {
        super()
    }
}

public sealed abstract class SealedExpr {
    public init() {
    }
}

public class ConstExpr <: SealedExpr {
    public var value: Int64 = 0i64

    public init() {
        super()
    }
    public init(value: Int64) {
        super()
        this.value = value
    }
}

public class AddExpr <: SealedExpr {
    public var left: Int64 = 0i64

    public var right: Int64 = 0i64

    public init() {
        super()
    }
}

public class GenericBox<T> {
    public var content: T

    public init(content: T) {
        this.content = content
    }
    public func getContent(): T {
        content
    }
}
