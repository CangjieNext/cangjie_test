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
	"sync"
	"sync/atomic"
	"time"
)

var nPairs = 1
var nIter = 20000

var LockOSThread = false

type Pair struct {
  monIdx int64
  role   int64
  co     [2]*sync.Cond
}

func newPair(monIdx int, role int) *Pair {
  m := [2]sync.Mutex{}
  c := [2]*sync.Cond{sync.NewCond(&m[0]), sync.NewCond(&m[1])}
  return &Pair{
    monIdx: int64(monIdx),
    role:   int64(role),
    co:     c,
  }
}

func (pair *Pair) test(iter int) {

  idx := atomic.AddInt64(&(pair.monIdx), 1)

  o1 := pair.co[idx]
  o2 := pair.co[idx^1]

  o1.L.Lock()
  consumer := atomic.AddInt64(&(pair.role), 1) == 1

  if consumer {
    for cnt := 0; cnt < iter; cnt++ {
      o1.Wait()
      o2.L.Lock()
      o2.Signal()
      o2.L.Unlock()
    }
  } else {
    for cnt := 0; cnt < iter; cnt++ {
      o2.L.Lock()
      o2.Signal()
      o2.L.Unlock()
      o1.Wait()
    }
  }
  o1.L.Unlock()
}

func work(iter int, pair *Pair, startLatch, finish *sync.WaitGroup) {
  if LockOSThread {
    runtime.LockOSThread()
  }
  startLatch.Wait()
  pair.test(iter)
  finish.Done()
}

func workGroupExecute(nIter int, nPairs int) int64 {
  var startLatch, finish sync.WaitGroup
  startLatch.Add(1)
  finish.Add(nPairs * 2)

  iterForPair := nIter / nPairs

  for i := 0; i < nPairs; i++ {
    pair := newPair(-1, 0)
    go work(iterForPair, pair, &startLatch, &finish)
    go work(iterForPair, pair, &startLatch, &finish)
  }

  startTime := time.Now()
  startLatch.Done()
  finish.Wait()
  return time.Since(startTime).Milliseconds()
}

func parseArgs(args []string) {
  defer func() {
    if err := recover(); err != nil {
      fmt.Println("Usage: [-iter <num>] [-threadPairs <numx>] [-os-thread]")
      os.Exit(1)
    }
  }()
  for pos := 0; pos < len(args); pos += 2 {
    option := args[pos]

    if option == "-os-thread" {
      LockOSThread = true
      pos--
      continue
    }

    value, err := strconv.Atoi(args[pos+1])

    if value <= 0 || err != nil {
      panic("value not valid!")
    }

    if option == "-iter" {
      nIter = value
    } else if option == "-threadPairs" {
      nPairs = value
    } else {
      panic("option not valid!")
    }
  }
}

func main() {

  // fmt.Println("GOMAXPROCS:", runtime.GOMAXPROCS(0))

  args := os.Args
  parseArgs(args[1:])
  fmt.Print("Started: ", nIter, "iterations for ", nPairs, " thread pairs")
  fmt.Print(" (GOMAXPROCS = ", runtime.GOMAXPROCS(0), ", LockOSThread = ", LockOSThread, ")")
  fmt.Println()

  workGroupExecute(20000, 2)
  elapsedTiem := workGroupExecute(nIter, nPairs)

  fmt.Println("Time, ms:", elapsedTiem)
}
