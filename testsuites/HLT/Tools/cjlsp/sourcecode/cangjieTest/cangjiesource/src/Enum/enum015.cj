package default.Enum

enum EE15 {
    | Foot(Int64)
    | Foot(Int64, Int16)
}

var c1 = EE15.Foot(1)
var c2 = EE15.Foot(1, 2)

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
