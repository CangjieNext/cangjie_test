/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class CA<T> {
    static var a = 9
}
 
main() {
    println(CA<Int64>.a)
    println(CA<Bool>.a)
 
    CA<Int64>.a = 20
    CA<Bool>.a = 99
 
    println(CA<Int64>.a)
    println(CA<Bool>.a)
}
