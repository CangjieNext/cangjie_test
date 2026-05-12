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
    public prop p: Bool {get(){true}}
    public prop p8: UInt8 {get(){9}}
    public prop p16: UInt16 {get(){17}}
    public prop p32: UInt32 {get(){33}}
    public prop p64: UInt64 {get(){65}}
    public prop pN: UIntNative {get(){129}}
    public prop pf32: Float32 {get(){3.15}}
    public prop pf64: Float64 {get(){3.14}}

    public static prop stP: Bool {get(){true}}
    public static prop stP8: UInt8 {get(){9}}
    public static prop stP16: UInt16 {get(){17}}
    public static prop stP32: UInt32 {get(){33}}
    public static prop stP64: UInt64 {get(){65}}
    public static prop stPN: UIntNative {get(){129}}
    public static prop stPf32: Float32 {get(){3.15}}
    public static prop stPf64: Float64 {get(){3.14}}
}
