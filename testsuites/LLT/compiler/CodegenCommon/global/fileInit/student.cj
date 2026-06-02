// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package student

internal import std.collection.HashMap

public enum FieldTypeType {
    | hashmap
    | other
}

public class ReflectFieldType <: Equatable<ReflectFieldType> {
    public ReflectFieldType(public let name: String, public let fieldType: FieldTypeType) {}
    public operator func ==(other: ReflectFieldType): Bool {
        return true
    }

    public operator func !=(other: ReflectFieldType): Bool {
        return false
    }
}

public class Teacher<K, V> where K <: Hashable & Equatable<K> {
    public var name: String = ""
    public var age: Int64 = 0

    static let METHOD: TeacherReflectMethod<K, V> = TeacherReflectMethod<K, V>("test",
        [ReflectFieldType("HashMap<K, V>", FieldTypeType.hashmap)])
}

public class TeacherReflectMethod<K, V> where K <: Hashable & Equatable<K> {
    private let identifier: String
    TeacherReflectMethod(private let name: String, private let paramTypes: Collection<ReflectFieldType>) {
        this.identifier = name
    }
}
