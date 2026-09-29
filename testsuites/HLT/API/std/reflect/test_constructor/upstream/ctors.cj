/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

public class SimpleCtorClass {
    public var name: String = ""

    public init() {
    }
    public init(name: String) {
        this.name = name
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

public class MultiCtorClass {
    public var x: Int64 = 0i64

    public var y: Int64 = 0i64

    public init() {
    }
    public init(x: Int64) {
        this.x = x
    }
    public init(x: Int64, y: Int64) {
        this.x = x
        this.y = y
    }
}

public class AnnotatedCtorClass {
    public var value: Int64 = 0i64

    @Deprecated
    public init() {
    }
    public init(value: Int64) {
        this.value = value
    }
}
