/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common enum E {
    Y | X | X(Int64)

    operator public common func ()(p: Int64): Unit
    public common operator func ()(p: Float64): Unit
}
