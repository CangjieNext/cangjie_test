// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Main {
    public static void main(String[] args) {
        GenericEnumInt32 red = GenericEnumInt32.Red(100);
        red.printValue();
        System.out.println("java: " + red.getValue());
        System.out.println("java: " + red.setValue(200));
        GenericEnumInt64 blue = GenericEnumInt64.Blue(300);
        blue.printValue();
        System.out.println("java: " + blue.getValue());
        System.out.println("java: " + blue.setValue(400));
    }
}

