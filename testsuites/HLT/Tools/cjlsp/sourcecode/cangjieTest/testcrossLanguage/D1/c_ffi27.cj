/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

foreign func nativeFun(b: CFunc<() -> Int32>): Int32

@C
func callback(): Int32 {
    thrower()
}

func thrower() {
    throw core.Exception()
}

func test27(): Int64 {
    try {
        let x = unsafe {
            nativeFun(callback)
        }
    } catch (_: Exception) {
        return 0
    }

    return 1
}
