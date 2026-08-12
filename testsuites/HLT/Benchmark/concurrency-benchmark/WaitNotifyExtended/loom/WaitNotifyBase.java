/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.concurrent.CountDownLatch;


public class WaitNotifyBase extends WaitNotifyBench {

  public WaitNotifyBase(int consumers, int producers, int valuePerProducer) {
    super(consumers, producers, valuePerProducer);
  }

  public String name() { return "WaitNotifyBase      "; }

  static Object monitorForConsumer = new Object();
  static Object monitorForProducer = new Object();

  static class Consumer extends WaitNotifyBench.Consumer {
    public Consumer(int id, WorkList workList) { super(id, workList); }

    protected void consumerLoop() throws InterruptedException {
      synchronized (monitorForConsumer) {
        while (workList.isEmpty()) {
          monitorForConsumer.wait();
        }

        Object work = workList.pop();
        consumed += 1;

        if (workList.isEmpty()) {
          synchronized (monitorForProducer) { monitorForProducer.notify(); }
        }
      }
    }
  }

  static class Producer extends WaitNotifyBench.Producer {
    public Producer(int id, WorkList workList, int valPerProducer,
                    CountDownLatch startSignal) {
      super(id, workList, valPerProducer, startSignal);
    }

    protected void producerLoop() throws InterruptedException {
      synchronized (monitorForConsumer) {
        for (int i = 0; i < VALUE_PER_PRODUCER; i++)
          workList.push(CONSUMING_UNIT);
        monitorForConsumer.notifyAll();
      }

      synchronized (monitorForProducer) {
        while (!workList.isEmpty()) {
          monitorForProducer.wait();
        }
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
