/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base {}

func fn(a: Base): Unit {
    let _ = a
}

func fn(a: Int64): Unit {
    println(a)
}

main() {
    fn(Base())
    fn(1)
}
