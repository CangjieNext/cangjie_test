/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
  "sync"
  "sync/atomic"
)

type base struct {
  muForConsumer *sync.Mutex
  coForConsumer *sync.Cond
  muForProducer *sync.Mutex
  coForProducer *sync.Cond
}

func NewBase() *base {
  var mc = sync.Mutex{}
  var mp = sync.Mutex{}

  return &base{muForConsumer: &mc,
    coForConsumer: sync.NewCond(&mc),
    muForProducer: &mp,
    coForProducer: sync.NewCond(&mp)}
}

func (b *base) name() string {
  return "base"
}

func (b *base) consumerLoop(c *Consumer) {
  defer b.coForConsumer.L.Unlock()
  b.coForConsumer.L.Lock()
  for c.workList.isEmpty() {
    if atomic.LoadInt64(&c.shouldStop) != 0 {
      return
    }
    b.coForConsumer.Wait()
  }

  c.workList.pop()
  c.consumed++

  if c.workList.isEmpty() {
    b.coForProducer.L.Lock()
    b.coForProducer.Signal()
    b.coForProducer.L.Unlock()
  }
}

func (b *base) producerLoop(p *Producer) {
  b.coForConsumer.L.Lock()
  for i := 0; i < p.VALUE_PER_PRODUCER; i++ {
    p.workList.push(CONSUMING_UNIT)
    b.coForConsumer.Broadcast()
  }
  b.coForConsumer.L.Unlock()

  b.coForProducer.L.Lock()
  for !p.workList.isEmpty() {
    if atomic.LoadInt64(&p.shouldStop) != 0 {
      b.coForProducer.L.Unlock()
      return
    }
    b.coForProducer.Wait()
  }
  b.coForProducer.L.Unlock()
}

func (b *base) start() {}

func (b *base) finish() {
  b.coForConsumer.L.Lock()
  b.coForConsumer.Broadcast()
  b.coForConsumer.L.Unlock()
  b.coForProducer.L.Lock()
  b.coForProducer.Broadcast()
  b.coForProducer.L.Unlock()
}

func (b *base) createConsumer(id int, endSignal *sync.WaitGroup) *Consumer {
  return &Consumer{id, &WORKLIST, 0, b.consumerLoop, endSignal, 0}
}

func (b *base) createProducer(id int, startSignal, endSignal *sync.WaitGroup) *Producer {
  return &Producer{id, &WORKLIST, VALUE_PER_PRODUCER, startSignal, b.producerLoop, endSignal, 0}
}
