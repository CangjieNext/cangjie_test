/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public interface I {
    prop p: Int64 {
        get() {
            0
        }
    }
    func f(): Int64 {
        0
    }
}

common public class C {}

common extend C <: I {
    common public prop p: Int64 {
        get() {
            0
        }
    }
    common public func f(): Int64 {
        0
    }
}
