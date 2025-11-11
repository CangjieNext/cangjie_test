/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common extend Int64{
    public common prop p: Int64 { get(){0} }
    public common func f(): Int64 { 0 }
}

public func f1() {
    if (1.f() + 1.p == 2) {
        return 0
    }
    return 1
}
