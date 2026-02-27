/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public interface I {
    public func f(): Unit
}
public class S {
    public init(a: I) {a.f()}
    public func f1(a: I) {a.f()}
    public static func f2(a: I) {a.f()}
}
