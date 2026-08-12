/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.concurrent.CountDownLatch;


public abstract class WaitNotifyBench {

  public static final int WARMUP_TIME = 1000;
  public static final int BENCH_TIME = 10000;
  public static final Object CONSUMING_UNIT = new Object();

  public static int SPINNERS;

  protected final int CONSUMERS;
  protected final int PRODUCERS;
  protected final int VALUE_PER_PRODUCER;
  protected final WorkList workList = new WorkList();

  public WaitNotifyBench(int consumers, int producers, int valuePerProducer) {
    CONSUMERS = consumers;
    PRODUCERS = producers;
    VALUE_PER_PRODUCER = valuePerProducer;
  }

  public abstract String name();

  static class WorkList {
    private volatile int contains = 0;

    public boolean isEmpty() { return contains == 0; }

    public void push(Object data) { contains++; }

    public Object pop() {
      if (isEmpty()) {
        System.err.println("Should not reach here");
        throw new RuntimeException();
      }
      contains--;
      return CONSUMING_UNIT;
    }
  }

  static abstract class Consumer implements Runnable {
    protected int id;
    protected WorkList workList;
    protected int consumed = 0;

    public Consumer(int id, WorkList workList) {
      this.id = id;
      this.workList = workList;
    }

    protected int consumed() { return consumed; }

    protected abstract void consumerLoop() throws Exception;

    public void run() {
      try {
        while (true) {
          consumerLoop();
        }
      } catch (Exception e) {
      }
    }
  }

  static abstract class Producer implements Runnable {
    protected int id;
    protected WorkList workList;
    protected int VALUE_PER_PRODUCER;

    private final CountDownLatch startSignal;

    public Producer(int id, WorkList workList, int valPerProducer,
                    CountDownLatch startSignal) {
      this.startSignal = startSignal;

      this.id = id;
      this.workList = workList;
      this.VALUE_PER_PRODUCER = valPerProducer;
    }

    protected abstract void producerLoop() throws Exception;

    public void run() {
      try {
        startSignal.await();
        while (true) {
          producerLoop();
        }
      } catch (Exception e) {
      }
    }
  }

  static class Spinner implements Runnable {
    public volatile boolean shouldStop = false;
    private int id;
    private final CountDownLatch startSignal;

    public Spinner(int id, CountDownLatch startSignal) {
      this.startSignal = startSignal;
      this.id = id;
    }

    public void run() {
      try {
        startSignal.await();
        while (!shouldStop) {
        }
      } catch (InterruptedException e) {
      }
    }
  }

  public abstract Consumer createConsumer(int id);
  public abstract Producer createProducer(int id, CountDownLatch startSignal);

  private void bench(int time, boolean shouldPrint) throws Exception {

    System.gc();
    Consumer[] cons = new Consumer[CONSUMERS];
    Thread[] tcons = new Thread[CONSUMERS];
    for (int i = 0; i < CONSUMERS; i++) {
      cons[i] = createConsumer(i);
      tcons[i] = Thread.ofVirtual().start(cons[i]);
    }

    final CountDownLatch startSignalForProducers = new CountDownLatch(1);

    Thread[] prods = new Thread[PRODUCERS];
    for (int i = 0; i < PRODUCERS; i++) {
      prods[i] = Thread.ofVirtual().start(createProducer(i, startSignalForProducers));
    }

    final CountDownLatch startSignalForSpinners = new CountDownLatch(1);

    Spinner[] spinners = new Spinner[SPINNERS];
    Thread[] spinnersT = new Thread[SPINNERS];
    for (int i = 0; i < SPINNERS; i++) {
      spinners[i] = new Spinner(i, startSignalForSpinners);
      spinnersT[i] = Thread.ofVirtual().start(spinners[i]);
      spinnersT[i].start();
    }

    System.gc();
    startSignalForSpinners.countDown();

    final long start = System.currentTimeMillis();
    startSignalForProducers.countDown();
    try {
      Thread.sleep(time);
    } catch (Exception e) {
      System.exit(-1);
    }

    for (int i = 0; i < PRODUCERS; i++) {
      prods[i].interrupt();
    }

    for (int i = 0; i < CONSUMERS; i++) {
      tcons[i].interrupt();
    }

    for (int i = 0; i < PRODUCERS; i++) {
      prods[i].join();
    }

    for (int i = 0; i < CONSUMERS; i++) {
      tcons[i].join();
    }

    for (int i = 0; i < SPINNERS; i++) {
      spinners[i].shouldStop = true;
      spinnersT[i].join();
    }

    final long realTime = System.currentTimeMillis() - start;

    long unitsConsumed = 0;
    for (int i = 0; i < CONSUMERS; i++) {
      unitsConsumed += cons[i].consumed();
    }

    if (shouldPrint) {
      System.out.println(name() + " (p = " + PRODUCERS + ", c = " + CONSUMERS +
                         ", v = " + VALUE_PER_PRODUCER + ", s = " + SPINNERS +
                         ")");
      System.out.println("units per ms: " + ((1.0 * unitsConsumed) / realTime));
    }
  }

  public void bench() {
    try {
      bench(WARMUP_TIME, false);
      bench(BENCH_TIME, true);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static void main(String[] arg) {
    int consumers = -1, producers = -1, valuePerProducer = -1;
    String mode = arg[0];
    WaitNotifyBench b = null;

    try {
      for (int i = 1; i < arg.length; i++) {
        String[] kv = arg[i].split("=");
        String k = kv[0]; 
        int v = Integer.parseInt(kv[1]);

        if (k.equals("c")) {
          consumers = v;
        } else if (k.equals("p")) {
          producers = v;
        } else if (k.equals("v")) {
          valuePerProducer = v;
        } else if (k.equals("s")) {
          SPINNERS = v;
        }
      }

      if (consumers < 0 || producers < 0 || valuePerProducer< 0 || SPINNERS < 0) {
        throw new Exception();
      }

      if (mode.equals("base")) {
        b = new WaitNotifyBase(consumers, producers, valuePerProducer);
      } else if (mode.equals("concurrent")) {
        b = new WaitNotifyConcurrent(consumers, producers, valuePerProducer);
      } else if (mode.equals("singleLock")) {
        b = new WaitNotifySingleLock(consumers, producers, valuePerProducer);
      } else {
        System.out.println(mode);
        throw new Exception();
      }
    } catch (Exception e) {        
      System.out.println("Usage: <mode> c=<consumers> p=<producers> v=<valuePerProducer> s=<spinners>");
      e.printStackTrace();
      System.exit(1);
    }

    b.bench();
  }
}
