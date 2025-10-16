/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common struct C {
    public var v1 = 0
}

common extend C {
    public common mut prop p1: Int64 {
        get(){0}
        set(v){v}
    }
    public common mut func f1(): Int64 {
        v1 = 0
        0
    }
}
