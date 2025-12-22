/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

operatorcommon common struct A {
    public common abstract var a: Int64
    public static common var b: Int64
    private static open common func f(): Int64
    public common sealed func f(a: Int64): Int64 { f() }
    public init() {}
}
