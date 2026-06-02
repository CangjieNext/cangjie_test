/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgA

public interface I1 {
    prop v: Int64 {
        get() {
            0
        }
    }
}

public interface I2 <: I1 {
    prop v: Int64 {
        get() {
            1
        }
    }
}
