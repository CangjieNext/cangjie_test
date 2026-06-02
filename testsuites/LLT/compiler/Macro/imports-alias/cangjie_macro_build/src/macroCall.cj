// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

import define.X.*
import define.X as define_X

main() {
    var a = @define_X.X(0) + @X(1) + @define_X.Y[1](2) + @Y[1](3)
    if (a != 6) {
        return 1
    }
    return 0
}
