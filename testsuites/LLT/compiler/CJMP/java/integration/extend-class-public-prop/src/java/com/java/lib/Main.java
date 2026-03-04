// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.User;

public class Main {
    public static void main(String[] args) {
        User user = new User();
        System.out.println("java: " + user.getItem_3());
        user.setPp(20);
        System.out.println("java: " + user.getPp());
        user.setSp(40);
        System.out.println("java: " + user.getSp());
    }
}
