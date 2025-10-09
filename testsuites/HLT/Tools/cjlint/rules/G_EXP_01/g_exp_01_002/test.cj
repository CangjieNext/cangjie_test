enum TimeUnit {
    | Year(Int64)
    | Month(Int64, Int64)
    | Day(Int64, Int64, Int64)
    | Hour(Int64, Int64, Int64, Int64)
}
var oneYear = Year(1)
var howManyHours = match (oneYear) { 
    case Year(y) => 0
    case Month(y, m) => 1
    case Day(y, m, d) => 2
    case Hour(y, m, d, h) => 3
}
main(){}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
