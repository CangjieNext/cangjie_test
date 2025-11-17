/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
public class ReturnType {
    public String foo() {
        return "foo";
    }
    public static String staticfoo() {
        return "staticfoo";
    }

    public String goo() {
        return null;
    }
    public static String staticgoo() {
        return null;
    }
}