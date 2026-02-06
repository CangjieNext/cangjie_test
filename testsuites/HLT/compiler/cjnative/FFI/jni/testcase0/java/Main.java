/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class Main {
    static {
        String dllBasePath = System.getProperty("user.dir") + "/build/lib/";
        System.out.println("begin loading.");
        System.load(dllBasePath + "libsecurec.dll");
        System.load(dllBasePath + "libcangjie-runtime.dll");
        System.load(dllBasePath + "libjni_native.dll");
        System.load(dllBasePath + "libjavacallcj.dll");
        System.out.println("all loaded successfully.");
    }

    public static void main(String[] args) {
        System.out.println("Java main start");
        try {
            nativeEntry((code, msg) -> {
                System.out.println("callback: " + code + ", " + msg);
            });

            // wait for cangjie spawn
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("Java main end");
        nativeCleanup();
    }

    private static native void nativeEntry(Callback cb);
    private static native void nativeCleanup();
}