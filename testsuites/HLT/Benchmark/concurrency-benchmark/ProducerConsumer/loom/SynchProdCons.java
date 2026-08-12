/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

public class SynchProdCons {

    static int nPairs = 1;
    static int nIter = 20000;

    static class Pair {
        AtomicInteger monIdx = new AtomicInteger(-1);
        AtomicInteger role = new AtomicInteger(0);
        Object[] monitors = {new Object(), new Object()};

        void test(int iter) throws Exception {
            int idx = monIdx.incrementAndGet();

            Object o1 = monitors[idx];
            Object o2 = monitors[idx ^ 1];

            synchronized (o1) {
                boolean consumer = (role.incrementAndGet() == 1); //came first - be a producer

                if (consumer) {
                    for (int cnt = 0; cnt < iter; cnt++) {
                        o1.wait();
                        synchronized (o2) { o2.notify(); }
                    }
                } else {
                    for (int cnt = 0; cnt < iter; cnt++) {
                        synchronized (o2) { o2.notify(); }
                        o1.wait();
                    }
                }
            }
        }
    }


/////////////////////////


    static void parseArgs(String args[]) throws Exception {
        for (int pos = 0; pos < args.length; pos +=2 ) {
            String option = args[pos];
            int value = Integer.parseInt(args[pos + 1]);

            if (value <= 0)
                throw new Exception();

            if (option.equals("-iter")) {
                nIter = value;
            } else if (option.equals("-threadPairs")) {
                nPairs = value;
            } else
                throw new Exception();
        }
    }

    static public void main(String args[]) throws Exception {

        try {
            parseArgs(args);
        } catch (Exception e) {
            System.out.println("Usage: [-iter <num>] [-threadPairs <numx>]");
            System.out.println("");
            System.exit(1);
        }

        System.out.println("Started: " + nIter + " iterations for " + nPairs + " thread pairs");

        new  WorkerGroup(20000, 2).execute();  // warm-up for JITs

        long elapsedTime = new WorkerGroup(nIter, nPairs).execute();

        System.out.println("Time, ms: " + elapsedTime);
    }
}


/////////////////////////


class WorkerGroup {

    private CountDownLatch startLatch;
    private Thread[] workers;

    WorkerGroup(int nIter, int nPairs) {
        startLatch = new CountDownLatch(1);

        workers = new Thread[nPairs * 2];

        int iterForPair = nIter / nPairs;

        for (int i = 0; i < nPairs; i++) {
            SynchProdCons.Pair pair = new SynchProdCons.Pair();
            workers[i * 2] =  Thread.ofVirtual().start(new Worker(iterForPair, pair));
            workers[i * 2 + 1] = Thread.ofVirtual().start(new Worker(iterForPair, pair));
        }
    }


    long execute() throws InterruptedException {
        long startTime = System.currentTimeMillis();

        startLatch.countDown();

        for (Thread w : workers) w.join();

        return (System.currentTimeMillis() - startTime);
    }


    class Worker implements Runnable {
        private int iterations;
        private SynchProdCons.Pair pair;

        Worker(int iterations, SynchProdCons.Pair pair) {
            this.iterations = iterations;
            this.pair = pair;
        }

        public void run() {
            try {
                startLatch.await();
                pair.test(iterations);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}