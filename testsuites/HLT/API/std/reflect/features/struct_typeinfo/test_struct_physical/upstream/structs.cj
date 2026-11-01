/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package upstream
public struct ThrowCtorStruct  {
public var ok: Int64 = 0i64

public init() {
}
public init(bomb: Bool) {
if (true) {
throw IllegalStateException("bomb triggered")
}
}
}
public struct BoxTarget  {
public var v1: Int64 = 11i64

public init() {
}
}
