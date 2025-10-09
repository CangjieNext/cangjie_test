/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.option_type

enum EE {
    Year | Month | Day1
}
class CC {}

let op1 = Option<Int32>.Some(12)
let op2 = Option<Int32>.None
let op3 = Option<Rune>.Some(r'b')
let op4 = Option<Bool>.Some(true)

let op5 = Option<EE>.Some(EE.Year)
let op6 = Option<CC>.Some(CC())

let n1: Int32 = match (op1) {
    case Some(num) => num
    case None => 0
}

let n2: Int32 = match (op2) {
    case Some(num) => num
    case None => 0
}

let n3: String = match (op5) {
    case Some(t) =>
        match (t) {
            case Year => "a"
            case Month => "b"
            case Day1 => "c"
        }
    case None => "None"
}
