/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public open specific class A {
    public specific init() {}
}

protected open specific class A2 <: A{
    public specific init() {}
}

public sealed abstract specific class A3{
    public specific init() {}
}

sealed specific class A4{
    public specific init() {}
}
