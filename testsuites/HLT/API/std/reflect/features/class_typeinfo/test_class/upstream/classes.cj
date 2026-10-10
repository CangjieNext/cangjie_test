/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package upstream
public class SimpleClass {
public var name: String = ""

public var value: Int64 = 0i64

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

public func increment(): Int64  {
this.counter = counter + 1i64
counter
}

public static var instanceCount: Int64 = 0i64

public static let className: String = "RichMemberClass"

public static func create(): RichMemberClass  {
return RichMemberClass()
}

public init() {
}
}
public open class Animal {
public var name: String = ""

public init() {
}
}
public abstract class Shape {
public init() {
}
}
public class Circle <:Shape {
public init() {
super()
}
}
public class Rectangle <:Shape {
public init() {
super()
}
}
public sealed abstract class SealedExpr {
public init() {
}
}
public class ConstExpr <:SealedExpr {
public init() {
super()
}
}
public class AddExpr <:SealedExpr {
public init() {
super()
}
}
public class NoCtorClass {
private init() {
}
}
