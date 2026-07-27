/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import java.util.concurrent.*;
import java.util.stream.*;

public class Scheduler {

    static int light = 0;
    static int heavy = 0;
    static int threads = 0;
    static final int heavyprime = 120_000_000;
    static final int lightprime = 60_000;
    static final boolean verbose = false;

    public static long blackhole(int v) {
      // Should be unoptimizable by compilers payload.
      // 
      // Seems like xorshift64 prng `k` steps are hard to generate
      // faster than just execution of `k` steps.
        
      final long m = v;
      final long p = 1000L * 1000L * 1000L + 7;
      long x = v;
      
      long s = 0;
      while (true) {
          // Countable loop deoptimization
          s = (s + p) % m;
          if (s == 0) {
            break;
          }

          x ^= x << 13;
          x ^= x >> 7;
          x ^= x << 17;

          x ^= x << 13;
          x ^= x >> 7;
          x ^= x << 17;

          x ^= x << 13;
          x ^= x >> 7;
          x ^= x << 17;

          x ^= x << 13;
          x ^= x >> 7;
          x ^= x << 17;

          x ^= x << 13;
          x ^= x >> 7;
          x ^= x << 17;

          x ^= x << 13;
          x ^= x >> 7;
          x ^= x << 17;

          x ^= x << 13;
          x ^= x >> 7;
          x ^= x << 17;
      }

      return x;	
    }
    
    static class Data {
        long beg;
        long end;
        long prime;
        boolean isHeavy;
    }

    static Data[] init(CountDownLatch lightStarter, CountDownLatch heavyStarter, CountDownLatch ready, CountDownLatch finish) {
        Data[] arr = new Data[threads];
        for (int j = 0; j < threads; ++j) {
            final int i = j;
            final int iters = j < heavy ? heavyprime + j : lightprime + j % 100;
            final CountDownLatch starter = j < heavy ? heavyStarter : lightStarter;

            Data d = new Data();
            arr[i] = d;
            d.isHeavy = j < heavy;

            Thread.startVirtualThread(() -> {
                try {
                    ready.countDown();
                    starter.await();
                } catch (Exception e) { }
                d.beg = System.currentTimeMillis();
                d.prime = blackhole(iters);
                d.end = System.currentTimeMillis();	
                finish.countDown();
            });
        }
        return arr;
    }

    static double measure() throws InterruptedException {
        CountDownLatch lightStarter = new CountDownLatch(1);	
        CountDownLatch heavyStarter = new CountDownLatch(1);	
        CountDownLatch ready = new CountDownLatch(threads);	
        CountDownLatch finish = new CountDownLatch(threads);	
    
        Data[] ds = init(lightStarter, heavyStarter, ready, finish);

    	// wait till all fibers reach starter latch
        ready.await();

        long start = System.currentTimeMillis();
  	    heavyStarter.countDown();
        Thread.sleep(1); 
        lightStarter.countDown();
        finish.await();

        long exec = 0;
        long sum = 0;
        long cnt = 0;
        for (Data d : ds) {
            if (d.isHeavy) {
                continue;
            }

            if (verbose) {
              System.out.println((d.end - start) + " " + (d.end - d.beg));
            }

            exec += d.end - d.beg;
            sum += d.end - start;
            cnt++;
        }
        System.out.println(((double) exec) / cnt);

        return ((double) sum) / cnt;
    }

    static void print(String pref) throws InterruptedException {

        double t = 0;
        t += measure();
        t += measure();
        t += measure();
        t += measure();

        t /= 4;

        System.out.println(pref + " " + t); 
    }
    
    // set global variable: light, heavy, threads
    static void parseArgs(String[] args) {
        String mode = args[0];
        if (mode.equals("preempt")) {
            light = 2000;
            heavy = 4;
        } else if (mode.equals("enmasse")) {
            light = 10000;
            heavy = 0;
        } else {
            throw new IllegalArgumentException();
        }
        if (args.length > 1) {
            light = Integer.parseInt(args[1]);
        }
        if (args.length > 2) {
            heavy = Integer.parseInt(args[2]);
            if (mode.equals("enmasse") && heavy != 0) {
                throw new IllegalArgumentException();
            }
        }
        threads = light + heavy;
    }
    
    public static void main(String[] args) throws InterruptedException {
        parseArgs(args);
        for (int i = 0; i < 1; ++i) {
            print("warmup" + i);
        }
        print("result");
    }
}
