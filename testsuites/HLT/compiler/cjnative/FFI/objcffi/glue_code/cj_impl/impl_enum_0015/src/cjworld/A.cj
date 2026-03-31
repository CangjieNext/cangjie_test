/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public enum A {
    | E1
    public prop p8: Int8 {get(){8}}
    public prop p16: Int16 {get(){16}}
    public prop p32: Int32 {get(){32}}
    public prop p64: Int64 {get(){64}}
    public prop pN: IntNative {get(){128}}

    public static prop stP8: Int8 {get(){8}}
    public static prop stP16: Int16 {get(){16}}
    public static prop stP32: Int32 {get(){32}}
    public static prop stP64: Int64 {get(){64}}
    public static prop stPN: IntNative {get(){128}}
}
