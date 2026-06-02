/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
=
package mp

public specific unsafe struct A {
    private specific operator func f(): Int64 { 0 }
    public common const var a: Int64 = 1
    unsafe static mut common var b: Int64 = 2
}

