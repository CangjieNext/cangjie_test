/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common common struct A {
    public common protected var a: Int64
    public static common var b: Int64
    private static redef common func f(): Int64
    public common overide func f(a: Int64): Int64 { f() }
}
