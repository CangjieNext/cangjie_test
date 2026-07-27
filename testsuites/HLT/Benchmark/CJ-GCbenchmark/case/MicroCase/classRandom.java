/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.lang.Integer;
import java.lang.System;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Random;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.CountDownLatch;


public class classRandom {
    static class Load {
        Random buffer = new Random();
    }

    static class Test {
        int test = 0;
    }

    static AtomicLong count_full = new AtomicLong(0);

    public static void recursive(long deep) {
        if (deep <= 0) {
            final long n = count_full.addAndGet(1);
            if (n % 100 == 0) {
                System.gc();
            }
            return;
        }
        ArrayList<Thread> futures = new ArrayList<>();
        var N = 10;
        for (int i = 0; i < N; ++i) {
            Thread f = new Thread(new Runnable() {
                @Override
                public void run() {
                    final Load load = new Load();
                    final int temp = load.buffer.nextInt(2);
                    recursive(deep - 1);
                }
            });
            f.start();
            futures.add(f);
        }
        for (Thread f : futures) {
            try {
               // f.start();
                f.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        return;
    }

    public static int class_traverse() {
        AtomicInteger atomic = new AtomicInteger(0);
        CountDownLatch syncCounter = new CountDownLatch(1);
        ArrayList<Random> className = new ArrayList<>();
        ArrayList<Thread> fut = new ArrayList<>();
        final int NUM = 250;
        for (int i = 0; i < NUM; ++i) {
            className.add(new Random());
        }

        for (int i = 0; i < NUM; ++i) {
            final int tmp_i = i;
            fut.add(
                new Thread(() -> {
                    try {
                        syncCounter.await();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    int tmp = className.get(tmp_i).nextInt(2);
                    int tmp_a = tmp_i;
                    int tmp_b = tmp_i;
                    try {
                        Thread.sleep(0);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    if (tmp_a != tmp_b) {
                        atomic.incrementAndGet();
                    }
            }));
            fut.get(tmp_i).start();
        }
        syncCounter.countDown();
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Test test_a = new Test();
        for (int i = 0; i < NUM; ++i) {
            int tmp = className.get(i).nextInt(2);

            Test test_b = new Test();
            test_b.test = i;
            if (i != 0 && test_a.test == test_b.test) {
                System.out.println("test_a.test == test_b.test");
                return 1;
            }
            test_a = test_b;
        }

        var count = atomic.get();
        if (count > 0) {
            System.out.println("tmp_a != tmp_b");
            return 1;
        }
        return 0;
    }

    public static void main(String[] args) {
        var start_total = System.nanoTime();

        int classResult = class_traverse();
        if (classResult != 0) {
            System.out.println("classResult != 0");
            return;
        }

        recursive(3);
        if (count_full.get() != 10 * 10 * 10 ) {
            System.out.println("count_full.load() != 10 * 10 * 10 * 10 * 10");
            return;
        }

        var end_total = System.nanoTime();
        System.out.println("classRandom: ms = " + (end_total - start_total) / 1000000.0);
        return;
    }
}