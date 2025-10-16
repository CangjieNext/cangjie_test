// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class M {
    public final long x;
    public long xm;

    public static final long xs = 5;
    public static long xms = xs;
    
    public final M m;
    public M mm;
    public static final M ms = new M(5);
    public static M mms = ms;

    public M(long i) {
        System.out.println("M(" + i + ")");
        this.x = i;
        this.xm = i;

        this.m = this;
        this.mm = this;
    }
}