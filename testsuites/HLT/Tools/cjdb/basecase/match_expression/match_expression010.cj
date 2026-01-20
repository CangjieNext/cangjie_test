/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func translate(n: Rune) {
    var a = match (n) {
        case "A" => 1
        case "B" => 2
        case "C" => 3
        case _ => -1
    }
}

func translate2(n: Byte) {
    var b = match (n) {
        case "1" => 1
        case "2" => 2
        case "3" => 3
        case _ => -1
    }
}

main() {
    var a = translate(r"C")
    var b = translate2(51)
    0
}

