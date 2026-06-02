/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


var temp = (1,1)
var res = match (temp) { 
    case (1,1) => 0
    case n => n
    case (1,2) => 2
    case (1,3) => 3
}
main(){}

