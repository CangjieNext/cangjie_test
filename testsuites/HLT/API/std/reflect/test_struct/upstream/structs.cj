/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

public struct SimpleStruct {
    public var x: Int64 = 0i64

    public var y: Int64 = 0i64

    public let label: String = "point"

    public init() {
    }
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

public struct MultiCtorStruct {
    public var name: String = ""

    public var value: Int64 = 0i64

    public var flag: Bool = false

    public init() {
    }
    public init(name: String) {
        this.name = name
    }
    public init(name: String, value: Int64) {
        this.name = name
        this.value = value
    }
    public init(name: String, value: Int64, flag: Bool) {
        this.name = name
        this.value = value
        this.flag = flag
    }
}

public struct RichMemberStruct {
    public var counter: Int64 = 0i64

    public let id: String = "S-001"

    public mut func increment(): Int64 {
        this.counter = this.counter + 1i64
        this.counter
    }

    public mut func scale(factor: Int64): Int64 {
        this.counter = this.counter * factor
        this.counter
    }

    public static var instanceCount: Int64 = 0i64

    public static let kind: String = "RichMemberStruct"

    public static prop config: String {
        get() {
            "struct-config"
        }
    }

    public static mut prop propCounter: Int64 {
        get() {
            0i64
        }
        set(v) {
        }
    }

    public prop label: String {
        get() {
            "instance-label"
        }
    }

    public init() {
    }
}

public struct GenericPair<A, B> {
    public var first: A

    public var second: B

    public init(first: A, second: B) {
        this.first = first
        this.second = second
    }
    public func getFirst(): A {
        this.first
    }

    public func getSecond(): B {
        this.second
    }
}
