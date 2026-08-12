/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
  "fmt"
  "os"
  "runtime"
  "strconv"
  "strings"
  "sync"
  "sync/atomic"
  "time"
)

const (
  WARMUP_TIME          = 1000
  BENCH_TIME           = 10000
  CONSUMING_UNIT int64 = 0
)

type mode int32

const (
  BASE       mode = 0
  SINGLELOCK mode = 1
  CHANNEL    mode = 2
)

var (
  CONSUMERS          int
  PRODUCERS          int
  VALUE_PER_PRODUCER int
  SPINNERS           int
  WORKLIST           WorkList
)

var LockOSThread = false

type benchI interface {
  name() string
  consumerLoop(*Consumer)
  producerLoop(*Producer)
  createConsumer(int, *sync.WaitGroup) *Consumer
  createProducer(int, *sync.WaitGroup, *sync.WaitGroup) *Producer
  start()
  finish()
}

type WorkList struct {
  contains int64
}

func (w *WorkList) isEmpty() bool {
  return atomic.LoadInt64(&w.contains) == 0
}

func (w *WorkList) push(int64) {
  atomic.AddInt64(&w.contains, 1)
}

func (w *WorkList) pop() int64 {
  if w.isEmpty() {
    fmt.Println("Should not reach here")
    panic("work list empty")
  }
  atomic.AddInt64(&w.contains, -1)
  return CONSUMING_UNIT
}

type Consumer struct {
  id           int
  workList     *WorkList
  consumed     int64
  consumerLoop func(*Consumer)

  endSignal *sync.WaitGroup

  shouldStop int64
}

func (c *Consumer) run(benchtime int) {
  if LockOSThread {
    runtime.LockOSThread()
  }

  for atomic.LoadInt64(&c.shouldStop) == 0 {
    c.consumerLoop(c)
  }

  c.endSignal.Done()
}

func (c *Consumer) interrupt() {
  atomic.StoreInt64(&c.shouldStop, 1)
}

type Producer struct {
  id                 int
  workList           *WorkList
  VALUE_PER_PRODUCER int

  startSignal  *sync.WaitGroup
  producerLoop func(*Producer)

  endSignal *sync.WaitGroup

  shouldStop int64
}

func (p *Producer) run(benchtime int) {
  if LockOSThread {
    runtime.LockOSThread()
  }

  p.startSignal.Wait()
  for atomic.LoadInt64(&p.shouldStop) == 0 {
    p.producerLoop(p)
  }
  p.endSignal.Done()
}

func (p *Producer) interrupt() {
  atomic.StoreInt64(&p.shouldStop, 1)
}

type Spinner struct {
  shouldStop  int64
  id          int
  startSignal *sync.WaitGroup
  endSignal   *sync.WaitGroup
}

func (s *Spinner) run() {
  if LockOSThread {
    runtime.LockOSThread()
  }

  s.startSignal.Wait()
  for atomic.LoadInt64(&s.shouldStop) == 0 {
  }
  s.endSignal.Done()
}

func bench(benchTime int, shouldPrint bool, b benchI) {
  // TODO: enable triger GC when CJ/JET support
  // runtime.GC()

  b.start()

  cons := make([]*Consumer, CONSUMERS)
  prods := make([]*Producer, PRODUCERS)

  var endSignalForConsumers sync.WaitGroup
  endSignalForConsumers.Add(CONSUMERS)
  for i := 0; i < CONSUMERS; i++ {
    cons[i] = b.createConsumer(i, &endSignalForConsumers)
    go cons[i].run(benchTime)
  }

  var startSignalForProducers, endSignalForProducers sync.WaitGroup
  startSignalForProducers.Add(1)
  endSignalForProducers.Add(PRODUCERS)

  for i := 0; i < PRODUCERS; i++ {
    prods[i] = b.createProducer(i, &startSignalForProducers, &endSignalForProducers)
    go prods[i].run(benchTime)
  }

  var startSignalForSpinners, endSignalForSpinners sync.WaitGroup
  spinners := make([]*Spinner, SPINNERS)
  startSignalForSpinners.Add(1)
  endSignalForSpinners.Add(SPINNERS)

  for i := 0; i < SPINNERS; i++ {
    s := &Spinner{0, i, &startSignalForSpinners, &endSignalForSpinners}
    spinners[i] = s
    go s.run()
  }

  // TODO: enable triger GC when CJ/JET support
  // runtime.GC()
  startSignalForSpinners.Done()

  start := time.Now()
  startSignalForProducers.Done()

  time.Sleep(time.Duration(benchTime) * time.Millisecond)

  for i := 0; i < PRODUCERS; i++ {
    prods[i].interrupt()
  }

  for i := 0; i < CONSUMERS; i++ {
    cons[i].interrupt()
  }

  b.finish()

  endSignalForConsumers.Wait()
  endSignalForProducers.Wait()

  for i := 0; i < SPINNERS; i++ {
    atomic.StoreInt64(&spinners[i].shouldStop, 1)
  }
  endSignalForSpinners.Wait()

  realtime := time.Since(start).Milliseconds()

  var unitsConsumed int64 = 0
  for i := 0; i < CONSUMERS; i++ {
    unitsConsumed += cons[i].consumed
  }

  if shouldPrint {
    fmt.Print(b.name(), " (p = ", PRODUCERS,
      ", c = ", CONSUMERS,
      ", v = ", VALUE_PER_PRODUCER,
      ", s = ", SPINNERS, ")")
    fmt.Print(" (GOMAXPROCS = ", runtime.GOMAXPROCS(0), ", LockOSThread = ", LockOSThread, ")")
    fmt.Println()
    fmt.Println("units per ms:", (float64(unitsConsumed) / float64(realtime)))
  }
}

func initbench(consumers, producers, valuePerProducer, spinners int) {
  CONSUMERS = consumers
  PRODUCERS = producers
  VALUE_PER_PRODUCER = valuePerProducer
  SPINNERS = spinners
  WORKLIST = WorkList{0}
}

func test(b benchI) {
  bench(WARMUP_TIME, false, b)
  bench(BENCH_TIME, true, b)
}

func parseArgs(args []string) (string, int, int, int, int) {
  defer func() {
    if err := recover(); err != nil {
      fmt.Println("Usage: <mode> c=<consumers> p=<producers> v=<valuePerProducer> s=<spinners> [-os-thread]")
      os.Exit(1)
    }
  }()

  if len(args) < 5 {
    panic("invalid")
  }

  mode := args[0]

  var consumers, producers, valuePerProducer, spinners int
  for i := 1; i < len(args); i++ {
    arg := args[i]

    if arg == "-os-thread" {
      LockOSThread = true
      continue
    }

    kv := strings.Split(arg, "=")
    k := kv[0]
    v, err := strconv.Atoi(kv[1])
    if v < 0 || err != nil {
      panic("invalid value")
    }

    switch k {
    case "c":
      consumers = v
    case "p":
      producers = v
    case "v":
      valuePerProducer = v
    case "s":
      spinners = v
    }
  }

  return mode, consumers, producers, valuePerProducer, spinners
}

func main() {
  args := os.Args
  mode, consumers, producers, valuePerProducer, spinners := parseArgs(args[1:])

  initbench(consumers, producers, valuePerProducer, spinners)

  switch mode {
  case "base":
    test(NewBase())
  case "singleLock":
    test(NewSingleLock())
  case "channel":
    test(NewChannel())
  default:
    panic("invalid mode")
  }
}
