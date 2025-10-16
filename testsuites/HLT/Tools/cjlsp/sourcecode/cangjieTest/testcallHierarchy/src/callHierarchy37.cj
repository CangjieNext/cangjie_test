/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//导入多个包内函数
import default.pkga.*
import default.pkgb.fb as ffff
import default.pkgc.AC

func ftest1(){
    var a = Ca.fa()
    ffff(5, b: 7)
    var b = AC()
    var c = AC(6)
    c.hh()
}

