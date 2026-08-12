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
  "time"
)

const FACTOR = 100

const (
  BIASED_LOCKING      = 0
  BACON_BITS          = 1
  MONITOR_UNCONTENDED = 2
  MONITOR_CONTENDED   = 3
)

var LockOSThread = false
var mode = BIASED_LOCKING
var nThreads = 1
var problemSize = 700000
var nSlicesForStat = 0

type Matrix struct {
  data    [][]int
  time    int
  maxTime int

  lastEnteredID    int
  ownerChanges     int
  timeSlice        int
  ownershipDistrib [][]int

  mu sync.Mutex
}

func newMatrix(nJobs int, jobLength int, nStatSlices int) *Matrix {
  data := make([][]int, nJobs)
  for i := range data {
    data[i] = make([]int, jobLength)
  }
  maxTime := nJobs * jobLength * FACTOR

  if nStatSlices != 0 {
    o := make([][]int, nStatSlices)
    for i := range o {
      o[i] = make([]int, nJobs)
    }
    return &Matrix{
      data:             data,
      maxTime:          maxTime,
      lastEnteredID:    -1,
      ownerChanges:     -1,
      ownershipDistrib: o,
      timeSlice:        maxTime / nStatSlices,
    }
  }

  return &Matrix{
    data:          data,
    maxTime:       maxTime,
    lastEnteredID: -1,
    ownerChanges:  -1,
  }
}

func (m *Matrix) postValidate() {
  if m.time != m.maxTime {
    fmt.Println("Validation failed: expected ", m.maxTime, " got ", m.time)
    os.Exit(1)
  }
}

func work(id int, m *Matrix, start, ready, finish *sync.WaitGroup) {
  if LockOSThread {
    runtime.LockOSThread()
  }
  ready.Done()
  start.Wait()

  for cnt := 0; cnt < FACTOR; cnt++ {
    len := len(m.data[id])
    for i := 0; i < len; i++ {
      m.mu.Lock()
      m.data[id][i] = id + i
      changed := (m.lastEnteredID != id)
      if changed {
        m.ownerChanges++
        m.lastEnteredID = id
      }
      if nSlicesForStat != 0 {
        slice := m.time / m.timeSlice
        m.ownershipDistrib[slice][id]++
      }
      m.time++
      m.mu.Unlock()
    }
  }

  finish.Done()
}

func bench(toPrint bool, sizeForAll int) {
  if mode == MONITOR_CONTENDED {
    if nThreads == 1 {
      fmt.Println("You opted for contended mode: thread number must be > 1")
      os.Exit(1)
    }
  } else {
    nThreads = 1
  }

  m := newMatrix(nThreads, sizeForAll/nThreads, nSlicesForStat)

  if mode == BACON_BITS {
    m.mu.Lock()
    m.mu.Unlock()
  } else if mode == MONITOR_UNCONTENDED {
    var latch sync.WaitGroup
    latch.Add(1)
    condition := sync.NewCond(&m.mu)
    go func() {
      condition.L.Lock()
      latch.Done()
      for true {
        // Under laboratory conditions of benchmark system this wait should not spuriously wake up.
        condition.Wait()
      }
      condition.L.Unlock()
    }()
    // Wait a bit to prevent interference of newly created thread.
    latch.Wait()
    time.Sleep(500 * time.Millisecond)
  }

  var start, ready, finish sync.WaitGroup
  start.Add(1)
  ready.Add(nThreads)
  finish.Add(nThreads)

  for i := 0; i < nThreads; i++ {
    go work(i, m, &start, &ready, &finish)
  }

  runtime.GC()

  ready.Wait()
  startTime := time.Now()
  start.Done()
  finish.Wait()
  time := time.Since(startTime).Milliseconds()

  m.postValidate()

  if toPrint {
    if nSlicesForStat != 0 {
      fmt.Println("Ownership distribution:")
      for slice := 0; slice < nSlicesForStat; slice++ {
        fmt.Print("|")
        for i := 0; i < nThreads; i++ {
          fmt.Print(" ", m.ownershipDistrib[slice][i], " |")
        }
        fmt.Println()
      }
    }
    fmt.Print("Ownership changes: ", m.ownerChanges)
    fmt.Print(" (GOMAXPROCS = ", runtime.GOMAXPROCS(0), ", LockOSThread = ", LockOSThread, ")")
    fmt.Println()

    fmt.Print("Time (workers = ", nThreads, " size = ", sizeForAll, "): ", time)
    fmt.Println()
  }
}

func parseArgs(args []string) {
  defer func() {
    if err := recover(); err != nil {
      fmt.Println("Usage: -biased | -bacon | -mon-uncontended | -mon-contended [-os-thread] [-size <value>] [-threads <num of threads>] [-scheduling-stat <num of slices>]")
      os.Exit(1)
    }
  }()

  for pos := 0; pos < len(args); pos++ {
    option := args[pos]
    if option == "-biased" {
      mode = BIASED_LOCKING
      continue
    } else if option == "-bacon" {
      mode = BACON_BITS
      continue
    } else if option == "-mon-uncontended" {
      mode = MONITOR_UNCONTENDED
      continue
    } else if option == "-mon-contended" {
      mode = MONITOR_CONTENDED
      continue
    } else if option == "-os-thread" {
      LockOSThread = true
      continue
    }

    pos++
    value, err := strconv.Atoi(args[pos])

    if value <= 0 || err != nil {
      panic("value invalid")
    }

    if option == "-size" {
      problemSize = value
    } else if option == "-threads" {
      nThreads = value
    } else if option == "-scheduling-stat" {
      nSlicesForStat = value
    } else {
      panic("invalid option")
    }
  }
}

func main() {

  args := os.Args
  parseArgs(args[1:])

  bench(false, 5000)
  bench(true, problemSize)
}
