/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class SynchProdConsConcurrent {

    static int nPairs = 1;
    static int nIter = 20000;

    static class Pair {
        AtomicInteger monIdx = new AtomicInteger(-1);
        AtomicInteger role = new AtomicInteger(0);
        ReentrantLock[] monitors = {new ReentrantLock(), new ReentrantLock()};
        Condition[] conditions = {monitors[0].newCondition(), monitors[1].newCondition()};

        void test(int iter) throws Exception {
            int idx = monIdx.incrementAndGet();

            ReentrantLock o1 = monitors[idx];
            Condition c1 = conditions[idx];
            ReentrantLock o2 = monitors[idx ^ 1];
            Condition c2 = conditions[idx ^ 1];

            o1.lock();
            try {
                boolean consumer = (role.incrementAndGet() == 1); //came first - be a producer

                if (consumer) {
                    for (int cnt = 0; cnt < iter; cnt++) {
                        c1.await();
                        o2.lock();
                        try {
                            c2.signal();
                        } finally {
                            o2.unlock();
                        }
                    }
                } else {
                    for (int cnt = 0; cnt < iter; cnt++) {
                        o2.lock();
                        try {
                            c2.signal();
                        } finally {
                           o2.unlock();
                        }
                        c1.await();
                    }
                }
            } finally {
                o1.unlock();
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
            SynchProdConsConcurrent.Pair pair = new SynchProdConsConcurrent.Pair();
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
        private SynchProdConsConcurrent.Pair pair;

        Worker(int iterations, SynchProdConsConcurrent.Pair pair) {
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
