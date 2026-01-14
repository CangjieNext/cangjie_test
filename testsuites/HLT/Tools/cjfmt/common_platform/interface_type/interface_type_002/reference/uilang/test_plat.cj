/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public interface I1 {
    specific mut func f(): Int64
}

specific struct S1 <: I1 {
    specific public mut func f1(): Int64 {
        1
    }
}
