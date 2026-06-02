/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

enum en {
    Day(Bool)
}

open class A {}

struct B {}

class C <: A & I {}

var arr: Array<Int64> = [1, 2, 3]
var a: A = A()
var b: B = B()
var c: C = C()
var d: en = Day(true)
var tu: (Int64, Int64) = (1, 2)
let score: Int64 = 10

interface I {
    func foo() {
        var result: String = match (score) {
            case 10 => match (a) {
                case _: A => match (b) {
                    case _: B => match (c) {
                        case _: C => match (d) {
                            case Day(true) => match (tu) {
                                case (x, y) => match (arr) {
                                    case _: Array<Int64> => match (a) {
                                        case _: A => match (b) {
                                            case _: B => match (c) {
                                                case _: A | _: B => "嵌套结束"
                                                case _ => "end"
                                            }
                                            case _ => "end"
                                        }
                                        case _ => "end"
                                    }
                                    case _ => "end"
                                }
                                case _ => "end"
                            }
                            case _ => "end"
                        }
                        case _ => "end"
                    }
                    case _ => "end"
                }
                case _ => "end"
            }
            case _ => "end"
        }
        return result
    }
}

main(): Int64 {
    if (C().foo() == "嵌套结束") {
        return 0
    } else {
        return 1
    }
}
