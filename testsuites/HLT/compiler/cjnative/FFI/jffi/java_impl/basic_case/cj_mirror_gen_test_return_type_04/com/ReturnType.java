/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
class ref01 {}
final class ref02 {}

public class ReturnType {
    public ref01 foo(ref01 ref) {
        return ref;
    }
    public ref02 goo(ref02 ref) {
        return ref;
    }
    public static ref01 staticfoo(ref01 ref) {
        return ref;
    }
    public static ref02 staticgoo(ref02 ref) {
        return ref;
    }
}