/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum myEnum {
    | Year(Float32)
}

func func1(): Int64 {
    let oneYear = Year(1.0)
    var howManyHours: Float32 = match (oneYear) {
        case Year(y) where y > 0.0 => y * 365.0 * 24.0
        case _ => 0.0
    }
    return 0
}

main(): Int64 {
    func1()

    return 0
}
