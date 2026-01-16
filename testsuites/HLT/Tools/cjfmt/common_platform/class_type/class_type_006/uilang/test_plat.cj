/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public open platform class A {
    public platform init() {}
}

protected open platform class A2 <: A{
    public platform init() {}
}

public sealed abstract platform class A3{
    public platform init() {}
}

sealed platform class A4{
    public platform init() {}
}
