// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import a.*
import a

public func foo(): Int64 {
    return a.GLOBAL_FOO
}

public func bar(): Int64 {
    return Bar<Int64>.GLOBAL_FOO
}

public func goo(): Int64 {
    return Bar<Int64>().GLOBAL_GOO
}
