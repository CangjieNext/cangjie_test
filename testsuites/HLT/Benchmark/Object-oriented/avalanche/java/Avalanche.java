/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;

class Avalanche {

    public static boolean shouldLog = false;
    public static Object blackHole = null;

    // consider experimenting with workload of warying size classes
    static class WorkloadObject {
        final long data;

        WorkloadObject(long x) {
            data = x;
        }
    }

    static void violation() {
        throw new RuntimeException("Should not reach here!");
    }

    static Thread startWorker(CountDownLatch cdl, long N) {
        final Thread thread = new Thread() {
            @Override
            public void run() {
                cdl.countDown();
                try {
                    cdl.await();
                } catch (InterruptedException e) {
                    violation();
                }

                workerLoop(N);
            }
        };

        thread.start();
        return thread;
    }

    static void workerLoop(long N) {

        // linear congruental generator
        // I suppose that it will not generate 17, ever :)
        int seed = 1013;
        int m = 22695477;
        int inc = 1;

        int randomNum = seed;

        int i = 0;
        Object objRef = new WorkloadObject(-1);
        while (i < N) {
            final Object tmp = new WorkloadObject(i);

            if (randomNum == 17) {
                System.out.println("i = " + i);

                // fake object escape
                blackHole = tmp;
                blackHole = objRef;
                violation();
            } else {
                objRef = tmp;
            }

            randomNum = (m * randomNum + inc); // modulo 2^32, standard int overflow
            i = i + 1;
        }

        blackHole = objRef;
    }

    static void measure(int w, long N) throws Exception {
        final CountDownLatch cdl = new CountDownLatch(w + 1);
        final ArrayList<Thread> workers = new ArrayList<Thread>();

        for (int i = 0; i < w; i++) {
            workers.add(startWorker(cdl, N));
        }

        final int oneMs = 1;
        // consider reworking this busy loop
        while (cdl.getCount() != 1) {
            Thread.sleep(oneMs);
        }

        final long start = System.nanoTime();
        cdl.countDown();

        for (Thread worker : workers) {
            worker.join();
        }

        if (shouldLog) {
            final double timeMs = (System.nanoTime() - start) / 1000000.0;
            System.out.printf("%d worker threads executed %d iterations each in %.0f ms\n", w, N, timeMs);
            final double eff = (1.0 * w * N) / timeMs;
            System.out.printf("  Throughput           : %f units / msec\n", eff);
            System.out.printf("  Normalized throughput: %f units / msec\n", eff / w);
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 3) {
            System.out.println("Usage: program <iterations.per.thread> <threads> <total.repeats>");
            return;
        }

        final long N = Long.parseLong(args[0]);
        final int W = Integer.parseInt(args[1]);
        final int R = Integer.parseInt(args[2]);

        System.out.println("Warmup phase...");
        shouldLog = false;
        measure(W, 100000);

        System.out.println("Measurements...");
        shouldLog = true;
        for (int i = 0; i < R; i++) {
            measure(W, N);
        }
    }
}
