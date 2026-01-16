/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform public interface NamedType {
    static platform func typename(): String {"ff"}
}

platform public interface I <: NamedType {
    static platform func typename(): String {
        "abc"
    }
    static platform func f(): String {"123"}
}
