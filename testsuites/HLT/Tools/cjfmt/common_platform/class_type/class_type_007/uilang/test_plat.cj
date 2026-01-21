/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public open platform class A {
    var a:Int64
    var b:Int64
    public const platform init() {
        a = 1
        b = 2
    }
}


public platform struct S {
    var a:Int64
    var b:Int64
    public const platform init() {
        a = 1
        b = 2
    }
}

