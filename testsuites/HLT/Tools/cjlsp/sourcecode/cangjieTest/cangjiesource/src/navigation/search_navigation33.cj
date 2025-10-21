/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

enum Either<T1, T2> {
    | Yeear(T1)
    | Moonth(T1, T2)
    | Daay(T1, T2, T2)
    | Hoour(T1, T2, T2, T2)
}
