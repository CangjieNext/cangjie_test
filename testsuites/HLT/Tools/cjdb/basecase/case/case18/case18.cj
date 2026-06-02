/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func identity<T>(a: T) {
    return a
}
func add(p1: Int64, p2: Int64) {
    p1 + p2
}

main():Int64 {
    var b = add(1, 3)
    var a = identity<Int64>(5)
    var c = identity<Int32>
    return 0
}
