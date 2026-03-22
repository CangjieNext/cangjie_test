// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Main {
    public static void main(String[] args) {
        Exe e = new Exe();
        e.PrintString("From java main to cj");
        CjExe cjExe = new CjExe(true);
        cjExe.PrintString1("Calling from CjExe");
        System.out.println(cjExe.GetString(true));
        System.out.println(cjExe.GetString(false));
        System.out.println(cjExe.GetStringOption());
        System.out.println(cjExe.GetStringOptionNone());
        cjExe.GetArgStringOpt("cjExe: GetArgStringOpt");
        cjExe.GetArgStringOpt("");
        cjExe.GetArgStringOpt(null);

        System.out.println(e.GetOptString());
        e.GetArgStringOpt("GetArgStringOpt");
        e.GetArgStringOpt("");
        e.GetArgStringOpt(null);
   }
}

