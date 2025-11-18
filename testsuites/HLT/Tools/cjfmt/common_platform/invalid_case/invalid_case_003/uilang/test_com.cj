/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

publicc common class A {
    public commonn var a: Int64
    public staticc common var b: Int64
    privatea common func f(): Int64
    publica common func f(a: Int64): Int64 { f() }
}
