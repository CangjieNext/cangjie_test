/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package returnType

import returnType.pkg_macro.ChangeFunc

@ChangeFunc
func f1() {
    let a = ""
    return a
}

func f2() {
    let a = ""
    return a
}

func f3() {
    
}
