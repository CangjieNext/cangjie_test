/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//递归调用
func fest6(a:Int64):Int64{
    fest6(fest6(fest6(6)))
    return ta()
}

func ta():Int64{return 1}
