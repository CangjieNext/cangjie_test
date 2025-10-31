/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A{}
main() {
    let score = 91
    
    var result: String = match(score){
        case 11 => "fail"
        case a : A => "pass"
        case _ => "excellent"
    }
}

