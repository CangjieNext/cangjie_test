/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

public interface SimpleInterface {
    public func doSomething(): Unit
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

public interface RichInterface {
    public func getName(): String

    public func compute(x: Int64, y: Int64): Int64

    public prop description: String

    public mut prop version: Int64
}

public interface GenericRepository<T> {
    public func save(item: T): Unit

    public func findById(id: Int64): T
}

public sealed interface SealedResult {
    public func unwrap(): String
}
