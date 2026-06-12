// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {

        CjExe cjExe = new CjExe("Str", null);

        // Testing Fields

        System.out.println(cjExe.GetStrFieldImpl());

        cjExe.SetStrFieldImpl("updated-cj");
        System.out.println(cjExe.GetStrFieldImpl());

        System.out.println(cjExe.GetNullableFieldImpl());

        cjExe.SetNullableFieldImpl("abc");
        System.out.println(cjExe.GetNullableFieldImpl());

        cjExe.SetNullableFieldImpl(null);
        System.out.println(cjExe.GetNullableFieldImpl());

        // Testing Nullable Argument Impl

        cjExe.AcceptNullableString("hello");
        cjExe.AcceptNullableString("");
        cjExe.AcceptNullableString(null);

        // Testing cj to java pass
        cjExe.PassStringsToJava();

        // Testing String Roundtrip

        System.out.println(cjExe.EchoString("hello"));
        System.out.println(cjExe.EchoString(""));

        // Testing Nullable String Roundtrip

        System.out.println("[" + cjExe.EchoNullableString("hello") + "]");
        System.out.println("[" + cjExe.EchoNullableString("") + "]");
        System.out.println("[" + cjExe.EchoNullableString(null) + "]");

        // Testing Arrays

        System.out.println(Arrays.toString(cjExe.GetStringArray()));
        System.out.println(Arrays.toString(
            cjExe.EchoStringArray(new String[] {"a", "", "b"})
        ));

        System.out.println(Arrays.toString(cjExe.GetNullableStringArray()));
        System.out.println(Arrays.toString(
            cjExe.EchoNullableStringArray(new String[] {"a", "", null})
        ));

        System.out.println(Arrays.toString(
            cjExe.ProcessStringArray(new String[] {"x", "", "y"})
        ));

        System.out.println(Arrays.toString(
            cjExe.ProcessNullableStringArray(new String[] {"x", "", null})
        ));

        // Testing Impl-only String

        System.out.println(cjExe.ProcessString("hello"));
        System.out.println(cjExe.ProcessString(""));
        System.out.println(cjExe.ProcessString(null));

        System.out.println(cjExe.ProcessNonNullString("hello"));
        System.out.println(cjExe.ProcessNonNullString(""));
    }
}
