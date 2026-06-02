/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Type

//跨文件使用别名
func f14() {
    var y1: MM = MM(4)
    var y2: AA = MM(6)
    MM.t2
    AA.t2
    y1.t1
    y2.t1
}
