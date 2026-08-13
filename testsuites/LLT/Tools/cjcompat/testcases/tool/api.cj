// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package A

public var x: Int64 = 10

public let y: Int32 = 12

public const z: Int16 = 15

public func foo<T>(a: T, b: Int64) {
    a
}

public struct S1<T> {
    public func f1(a: T) {
        a
    }
}

public enum E1<T> {
      e1(T)
    | e2
}

public class C1<T> {
    public func f1(a: T) {
        a
    }
}

extend<T> C1<T> {
    public func equals() {
        true
    }
}

public interface II1<T> {
    public func f1(a: T) {
        a
    }
}

public func goo(a: Int32, b: Int64) {
    a
}

public struct S2 {
    public func f1(a: Int64) {
        a
    }
}

public enum E2 {
      e1(Int64)
    | e2
}

public class C2 {
    public func f2(a: Int64) {
        a
    }
}

extend C2 {
    public func equals() {
        true
    }
}

public interface II2 {
    public func f2(a: Int64) {
        a
    }
}
