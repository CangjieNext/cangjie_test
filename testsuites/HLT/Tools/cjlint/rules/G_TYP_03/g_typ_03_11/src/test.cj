enum Number {
    | float(Float32)
    public static func foo() {
        let M: Float16 = { a: Float16 => a }(-0x.1p2)
        M
    }
}

main() {
    if (Number.foo() != Float16.NaN) {
        println(Number.foo())
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
