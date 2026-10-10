/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package upstream
public class SimpleStaticVarClass {
public static var count: Int64 = 42i64

public static let label: String = "hello"

}
public class MutableOnlyStaticVarClass {
public static var value: String = ""

public static var number: Int64 = 0i64

}
public class ImmutableOnlyStaticVarClass {
public static let fixed: Int64 = 42i64

}
