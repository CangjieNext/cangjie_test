/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common class C {}

common extend C {
    private common prop p: Int64 { get(){0} }
    private common func f(): Int64 { 0 }
    public func f1() {
        if(f() + p == 2) {
            return 0
        }
        return 1
    }
}
