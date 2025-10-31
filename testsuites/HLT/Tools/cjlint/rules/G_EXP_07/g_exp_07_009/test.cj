/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct A{
    const TEMP = 1
}

main(): Int64 {
    var a = 1
    if (A().TEMP == a) {
        return 0
    } else {
        return 1
    }
}

