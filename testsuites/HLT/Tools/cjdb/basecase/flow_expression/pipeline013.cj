/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1 {
    var a = 1
}

main() {
    var a1: Int8 = 0
    var a2: Int32 = 1
    var a3: Float32 = 2.0
    var a4: Bool = false
    var a5: Rune = r'e'
    var a6: Array<Int64> = [1, 2]
    var b1 = a1 |> {x: Int8 => x + 1}
    var b2 = a2 |> {x: Int32 => x + 1}
    var b3 = a3 |> {x: Float32 => x + 1.0}
    var b4 = a4 |> {x: Bool => x}
    var b5 = a5 |> {x: Rune => x}
    var b6 = a6 |> {x: Array<Int64> => x}
    var b7 = C1() |> {x: C1 => x}
    0
}
