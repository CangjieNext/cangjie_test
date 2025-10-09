/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
public class TestModifier03 {
    public double aDouble;
    protected float aFloat;
    private char aChar;
    public final int anInt = 1;
    public static final int anInt2;
    public transient byte aByte;
    public volatile boolean aBoolean;

    static {
        anInt2 = 2;
    }
}
