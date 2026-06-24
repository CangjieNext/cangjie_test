/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.aoo

main(): Int64 {
    println(greet())
    return 0
}

public func greet(): String {
    return "hello from aoo under custom src-dir"
}
