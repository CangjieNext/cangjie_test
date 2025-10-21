/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Point {
    let x: Int64 = 0
    let y: Int64 = 0    
}

extend Point{
    operator func !(): Int64 {
        return 1
    }
}

main(){

}
