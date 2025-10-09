/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    var a = 0
    var a1 = RED
    var a2 = BLUE
    var a3 = YELLOW
    match (a1) {
        case RED => a++
        case _ => a = 0
    }
    match (a2) {
        case BLUE => a++
        case _ => a = 0
    }
    match (a3) {
        case YELLOW => a++
        case _ => a = 0
    }
    return a - 3
}


