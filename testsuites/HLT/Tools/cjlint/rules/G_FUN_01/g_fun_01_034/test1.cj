/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
let x = -10
let y = match (x) {
    case 0 => "zero"
    case n => match(n){
        case 0 => "zero"
        case c => if (c < 10){
            if (c < 10){
                print(1)
            }
            else{
                if (c < 10){
                    while (c < 10){
                        print(1)
                        while (c < 10){
                            print(1)
                            if (c < 10){
                                print(1)
                            }
                        }
                    }
                }
            }
        }
    }
}
println(y)
}

