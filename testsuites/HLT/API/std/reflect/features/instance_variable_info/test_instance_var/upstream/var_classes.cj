/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package upstream
public class SimpleVarClass {
public init() {
}
public var count: Int64 = 42i64

public let label: String = "hello"

}
public class VarOnlyClass {
public init() {
}
public var value: String = ""

public var number: Int64 = 0i64

}
public class LetOnlyClass {
public init() {
}
public let fixed: Int64 = 42i64

}
public abstract class AbstractVarShape {
public var state: Int64 = 0i64

}
public class AnnotatedVarClass {
public init() {
}
@VarAnnotation
public var annotatedVar: Int64 = 1i64

@VarAnnotation
@SecondVarAnnotation
public var multiAnnotatedVar: String = "multi"

@VarAnnotation
@VarAnnotation
public var duplicateAnnotatedVar: Bool = true

}
