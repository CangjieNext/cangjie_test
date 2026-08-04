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

type channel struct {
  ch       chan int
  quit     chan int
  finished bool
}

func NewChannel() *channel {
  ch := make(chan int, PRODUCERS*VALUE_PER_PRODUCER)
  quit := make(chan int, CONSUMERS+PRODUCERS)

  return &channel{
    ch:       ch,
    quit:     quit,
    finished: false,
  }
}

func (ch *channel) name() string {
  return "channel"
}

func (ch *channel) consumerLoop(c *Consumer) {
  select {
  case <-ch.ch:
    atomic.AddInt64(&c.consumed, 1)
  case <-ch.quit:
    return
  }
}

func (ch *channel) producerLoop(p *Producer) {
  for i := 0; i < VALUE_PER_PRODUCER; i++ {
    select {
    case ch.ch <- 0:
    case <-ch.quit:
      return
    }
  }
}

func (ch *channel) start() {
  ch.finished = false
}

func (ch *channel) finish() {
  if ch.finished {
    return
  }

  for i := 0; i < CONSUMERS; i++ {
    ch.quit <- i
  }

  for i := 0; i < PRODUCERS; i++ {
    ch.quit <- (100 + i)
  }

  ch.finished = true
}

func (ch *channel) createConsumer(id int, endSignal *sync.WaitGroup) *Consumer {
  return &Consumer{id, &WORKLIST, 0, ch.consumerLoop, endSignal, 0}
}

func (ch *channel) createProducer(id int, startSignal, endSignal *sync.WaitGroup) *Producer {
  return &Producer{id, &WORKLIST, VALUE_PER_PRODUCER, startSignal, ch.producerLoop, endSignal, 0}
}
