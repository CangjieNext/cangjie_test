// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        System.out.println((new Impl(1)).getValue());
        System.out.println((new Impl(2, true)).getValue());
        System.out.println((new Impl(3, 4)).getValue());
    }
}
