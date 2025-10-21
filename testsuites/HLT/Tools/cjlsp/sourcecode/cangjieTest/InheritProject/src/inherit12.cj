/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

//重导出
package default
import default.pkgf.A12

public class B12 <: A12{
    public func f1_2():Unit {}
}
func fh(){
    var a = B12().f1_2
}
