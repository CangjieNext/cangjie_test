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

type singleLock struct {
  lockForData   *sync.Mutex
  coForConsumer *sync.Cond
  coForProducer *sync.Cond
}

func NewSingleLock() *singleLock {
  var lock = sync.Mutex{}
  return &singleLock{lockForData: &lock,
    coForConsumer: sync.NewCond(&lock),
    coForProducer: sync.NewCond(&lock)}
}

func (s *singleLock) name() string {
  return "singleLock"
}

func (s *singleLock) consumerLoop(c *Consumer) {
  defer s.lockForData.Unlock()
  s.lockForData.Lock()
  for c.workList.isEmpty() {
    if atomic.LoadInt64(&c.shouldStop) != 0 {
      return
    }
    s.coForConsumer.Wait()
  }

  c.workList.pop()
  c.consumed++

  if c.workList.isEmpty() {
    s.coForProducer.Signal()
  }
}

func (s *singleLock) producerLoop(p *Producer) {
  s.lockForData.Lock()
  for i := 0; i < p.VALUE_PER_PRODUCER; i++ {
    p.workList.push(CONSUMING_UNIT)
    s.coForConsumer.Broadcast()
  }
  s.lockForData.Unlock()

  s.lockForData.Lock()
  for !p.workList.isEmpty() {
    if atomic.LoadInt64(&p.shouldStop) != 0 {
      s.lockForData.Unlock()
      return
    }
    s.coForProducer.Wait()
  }
  s.lockForData.Unlock()
}

func (s *singleLock) start() {}

func (s *singleLock) finish() {
  s.lockForData.Lock()
  s.coForConsumer.Broadcast()
  s.coForProducer.Broadcast()
  s.lockForData.Unlock()
}

func (s *singleLock) createConsumer(id int, endSignal *sync.WaitGroup) *Consumer {
  return &Consumer{id, &WORKLIST, 0, s.consumerLoop, endSignal, 0}
}

func (s *singleLock) createProducer(id int, startSignal, endSignal *sync.WaitGroup) *Producer {
  return &Producer{id, &WORKLIST, VALUE_PER_PRODUCER, startSignal, s.producerLoop, endSignal, 0}
}
