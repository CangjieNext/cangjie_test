/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.concurrent.CountDownLatch;

public class EnterExit {
    static final int FACTOR = 100;  //to multiply problem size

    static final class Matrix {
        int[][] data;
        int time = 0;
        int maxTime;

        // ownership stat
        int lastEnteredId = -1;  // invalid
        int ownerChanges = -1;
        int timeSlice;
        int[][] ownershipDistrib;

        ////////////////

        Matrix(int nJobs, int jobLength, int nStatSlices) {
            this.data = new int[nJobs][jobLength];
            this.maxTime = nJobs * jobLength * FACTOR;

            if (nStatSlices != 0) {
                this.ownershipDistrib = new int[nStatSlices][nJobs];
                this.timeSlice = this.maxTime / nStatSlices;
            }
        }

        void postValidate() {
            if (this.time != this.maxTime) {
                System.out.println("Validation failed: expected " + this.maxTime + " got " + this.time);
                System.exit(1);
            }
        }
    }

    static class Worker implements Runnable {
        int id;
        final Matrix m;
        CountDownLatch start, ready, finish;

        Worker(int id, Matrix m, CountDownLatch start, CountDownLatch ready, CountDownLatch finish) {
            this.id = id;
            this.m = m;
            this.start = start;
            this.ready = ready;
            this.finish = finish;
        }

        public void run() {
            try {
                ready.countDown();
                start.await();

                for (int cnt = 0; cnt < FACTOR; cnt++) {
                    int len = m.data[id].length;
                    for (int i = 0; i < len; i++) {
                 
                        synchronized (m) {
                            m.data[id][i] = id + i;

                            boolean changed = (m.lastEnteredId != id);
                            if (changed) {
                                m.ownerChanges++;
                                m.lastEnteredId = id;
                            }
                            if (nSlicesForStat != 0) {
                                int slice = m.time / m.timeSlice;
                                m.ownershipDistrib[slice][id]++;
                            }
                            m.time++;
                        }
                    }
                }

                finish.countDown();
                finish.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    enum Mode {BIASED_LOCKING, BACON_BITS, MONITOR_UNCONTENDED, MONITOR_CONTENDED}

    static Mode mode           = Mode.BIASED_LOCKING;
    static int  nThreads       = 1;
    static int  problemSize    = 700000;
    static int  nSlicesForStat = 0;

    static final volatile Matrix hide;
    static volatile Thread t;

    static void prepareMatrix(Matrix m) {
        if (mode == Mode.BACON_BITS) {
            synchronized (m) {};                        // false biasing
        } else if (mode == Mode.MONITOR_UNCONTENDED) {
            try {
                CountDownLatch latch = new CountDownLatch(1);
                // deflation prevention measure
                t = new Thread(() -> {
                    try {
			                  synchronized (hide) {
                    	      latch.countDown();
                            while (true) {
                                // Under laboratory conditions of benchmark system this wait should not spuriously wake up.
                                m.wait();
                            }
			                  }
                    } catch (InterruptedException e) {}
                });
            		t.setDaemon(true);
            		t.start();
                latch.await();
                // Wait a bit to prevent interference of newly created thread.
                Thread.sleep(500);
            } catch (InterruptedException e) {}
        }
    }

    static void bench(boolean toPrint, int sizeForAll) {
        if (mode == Mode.MONITOR_CONTENDED) {
            if (nThreads == 1) {
                System.out.println("You opted for contended mode: thread number must be > 1");
                System.exit(1);
            }
        } else
            nThreads = 1;

        // intentionally assign into static volatile variable to confuse partial escape analysis and prevent optimizing out some ifs inside `prepareMatrix` 
        hide = new Matrix(nThreads, sizeForAll / nThreads, nSlicesForStat);
        prepareMatrix(hide);

        Matrix m = hide;

        CountDownLatch start = new CountDownLatch(1);
        CountDownLatch ready = new CountDownLatch(nThreads);
        CountDownLatch finish= new CountDownLatch(nThreads);

        for (int i = 0; i < nThreads; i++) {
            Thread.ofVirtual().start(new Worker(i, m, start, ready, finish));
        }

        System.gc();

        try {
            ready.await();
            long startTime = System.currentTimeMillis();
            start.countDown();
            finish.await();

            long time = System.currentTimeMillis() - startTime;

            m.postValidate();

            if (toPrint) {
                if (nSlicesForStat != 0) {
                    System.out.println("Ownership distribution:");
                    for (int slice = 0; slice < nSlicesForStat; slice++) {
                        System.out.print("|");
                        for (int i = 0; i < nThreads; i++) {
                            System.out.print(" " + m.ownershipDistrib[slice][i] + " |");
                        }
                        System.out.println("");
                    }
                }
                System.out.println("Ownership changes: " + m.ownerChanges);
                System.out.println("Time (workers = " + nThreads + " size = " + sizeForAll + "): " + time);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    static void parseArgs(String args[]) throws Exception {
        for (int pos = 0; pos < args.length; pos++) {
            String option = args[pos];
            if (option.equals("-biased")) {
                mode = Mode.BIASED_LOCKING;
                continue;
            } else if (option.equals("-bacon")) {
                mode = Mode.BACON_BITS;
                continue;
            } else if (option.equals("-mon-uncontended")) {
                mode = Mode.MONITOR_UNCONTENDED;
                continue;
            } else if (option.equals("-mon-contended")) {
                mode = Mode.MONITOR_CONTENDED;
                continue;
            }

            pos++;
            int value = Integer.parseInt(args[pos]);

            if (value <= 0)
                throw new Exception();

            if (option.equals("-size")) {
                problemSize = value;
            } else if (option.equals("-threads")) {
                nThreads = value;
            }else if (option.equals("-scheduling-stat")) {
                nSlicesForStat = value;
            } else
                throw new Exception();
        }
    }

    public static void main(String[] args) {
        try {
            parseArgs(args);
        } catch (Exception e) {
            System.out.println("Usage: -biased | -bacon | -mon-uncontended | -mon-contended [-size <value>] [-threads <num of threads>] [-scheduling-stat <num of slices>]");
            System.exit(1);
        }

        bench(false, 5000);        //warm-up for "those JVM that need it"
        bench(true, problemSize);
    }
}
