/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public enum E {
    Y | X | X(Int64)

    specific public operator func ()(p: Int64) {}
    specific public operator func ()(p: Float64) {}
}
