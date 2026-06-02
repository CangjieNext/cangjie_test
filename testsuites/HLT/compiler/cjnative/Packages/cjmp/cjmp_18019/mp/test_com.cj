/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common enum A {
    | E
    public func f1() {1}
    public prop p1: Int64 {get(){1}}
    public static func f2() {1}
    public static prop p2: Int64 {get(){1}}
    public common func f3() {1}
    public common prop p3: Int64 {get(){1}}
    public common static func f4() {1}
    public common static prop p4: Int64 {get(){1}}
}
