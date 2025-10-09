enum TimeUnit {
    | A(Int64)
    | B(Int64, Int64)
    | C(Int64, Int64, Int64)
    | D(Int64, Int64, Int64, Int64)
}
var oneYear = A(1)
var howManyHours = match (oneYear) { 
    case B(y, m) => 1
    case _: TimeUnit => 2
    case C(y, m, d) => 3
    case D(y, m, d, h) => 4
}

main(){

}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
