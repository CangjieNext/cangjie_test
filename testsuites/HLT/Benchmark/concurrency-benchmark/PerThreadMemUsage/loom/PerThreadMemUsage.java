/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import java.util.concurrent.locks.*;

public class PerThreadMemUsage {

    public static volatile boolean allReady = false;
    public static final ReentrantLock m = new ReentrantLock();

    public static void create(AtomicInteger cnt) {
        Thread.startVirtualThread(() -> {
            int x = cnt.getAndAdd(-1) - 1;
            if (x == 0) {
                allReady = true;
            }
            m.lock();
        });
    }

    static void measure(int count) throws InterruptedException, ExecutionException {
        AtomicInteger cnt = new AtomicInteger(count);

        m.lock();
        for (int i = 0; i < count; ++i) {
            create(cnt);
        }

        while (!allReady) { }

        System.out.println("ready");

        while (true) { }
    }


    public static void main(String[] args) throws InterruptedException, ExecutionException {
        int count = Integer.parseInt(args[0]);

        measure(count);
    }
}
