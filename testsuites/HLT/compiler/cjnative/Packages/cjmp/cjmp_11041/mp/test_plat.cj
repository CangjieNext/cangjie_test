/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

public platform class C  {}

platform extend C {
    public platform func f(): Float64 { 1.0 }
    public platform prop p: Float64 { get(){1.0} }
}
