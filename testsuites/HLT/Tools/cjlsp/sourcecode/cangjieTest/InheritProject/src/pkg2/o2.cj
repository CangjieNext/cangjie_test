/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg2

import default.pkg1.*

interface N1 <: I2{
    override func size1_1(): Unit {}
}

interface N2 <: I2{
    func size1_1(): Unit {}
}

public interface I5{
    static func name():Unit
}
