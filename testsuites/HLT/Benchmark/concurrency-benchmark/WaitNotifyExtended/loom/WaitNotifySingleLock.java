/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


public class WaitNotifySingleLock extends WaitNotifyBench {

  public WaitNotifySingleLock(int consumers, int producers,
                              int valuePerProducer) {
    super(consumers, producers, valuePerProducer);
  }

  public String name() { return "WaitNotifySingleLock"; }

  static final Lock lockForData = new ReentrantLock();
  static final Condition conditionForConsumer = lockForData.newCondition();
  static final Condition conditionForProducer = lockForData.newCondition();

  static class Consumer extends WaitNotifyBench.Consumer {
    public Consumer(int id, WorkList workList) { super(id, workList); }

    protected void consumerLoop() throws Exception {
      try {
        lockForData.lock();
        while (workList.isEmpty()) {
          conditionForConsumer.await();
        }

        Object work = workList.pop();
        consumed += 1;

        if (workList.isEmpty()) {
          try {
            lockForData.lock();
            conditionForProducer.signal();
          } finally {
            lockForData.unlock();
          }
        }
      } finally {
        lockForData.unlock();
      }
    }
  }

  static class Producer extends WaitNotifyBench.Producer {
    public Producer(int id, WorkList workList, int valPerProducer,
                    CountDownLatch startSignal) {
      super(id, workList, valPerProducer, startSignal);
    }

    protected void producerLoop() throws Exception {
      try {
        lockForData.lock();
        for (int i = 0; i < VALUE_PER_PRODUCER; i++)
          workList.push(CONSUMING_UNIT);
        conditionForConsumer.signalAll();
      } finally {
        lockForData.unlock();
      }

      try {
        lockForData.lock();
        while (!workList.isEmpty()) {
          conditionForProducer.await();
        }
      } finally {
        lockForData.unlock();
      }
    }

    public void run() {
      try {
        while (true) {
          producerLoop();
        }
      } catch (Exception e) {
        //                System.err.println("Producer died");
      }
    }
  }

  public WaitNotifyBench.Consumer createConsumer(int id) {
    return new Consumer(id, workList);
  }

  public WaitNotifyBench.Producer createProducer(int id,
                                                 CountDownLatch startSignal) {
    return new Producer(id, workList, VALUE_PER_PRODUCER, startSignal);
  }
}