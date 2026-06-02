/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific class C {}

specific extend C <: I {
    public specific prop p: Int64 { get(){1} }
    public specific func f(): Int64 { 1 }
}
