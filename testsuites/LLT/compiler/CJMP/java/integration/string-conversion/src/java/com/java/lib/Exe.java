// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class Exe {

    public String strField = "java-field";
    public String nullableField = null;

    public void PrintString(String s) {
        System.out.println("[Java]PrintString: " + s);
    }

    public static void PrintStringStatic(String s) {
        System.out.println("[Java]PrintString: " + s);
    }

    public void AcceptNullableString(String arg) {
        System.out.println("[Java]AcceptNullableString: [" + arg + "]");
    }

    public String EchoString(String s) {
        return s;
    }

    public String EchoNullableString(String arg) {
        return arg;
    }

    public String[] GetStringArray() {
        return new String[] {"foo", "", "bar"};
    }

    public String[] EchoStringArray(String[] arg) {
        return arg;
    }

    public String[] GetNullableStringArray() {
        return new String[] {"foo", "", null, "bar"};
    }

    public String[] EchoNullableStringArray(String[] arg) {
        return arg;
    }
}
