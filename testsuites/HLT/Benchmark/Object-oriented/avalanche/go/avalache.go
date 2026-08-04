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

var shouldLog = false
var blackHole = CreateObject(-1)

func main() {
  fmt.Println("Running test with GOMAXPROCS = ", runtime.GOMAXPROCS(0))

  args := os.Args
  if (len(args) != 4) {
      fmt.Println("Usage: program <iterations.per.thread> <threads> <total.repeats>")
      return
  }

  var N, err1 = strconv.Atoi(args[1])
  if err1 != nil {
      return
  }

  var W, err2 = strconv.Atoi(args[2])
  if err2 != nil {
      return
  }

  var R, err3 = strconv.Atoi(args[3])
  if err3 != nil {
      return
  }

  fmt.Println("Warmup phase...")
  shouldLog = false
  measure(W, 100000)

  fmt.Println("Measurements...")
  shouldLog = true  
  for i := 0; i < R; i++ {
    measure(W, N)
  }
}

type CountDownLatch struct {  
  m       * sync.Mutex
  c       * sync.Cond
  counter int
}

func CreateLatch(N int) CountDownLatch {
  var m = sync.Mutex{}
  var c = sync.NewCond(&m)
 
  return CountDownLatch{&m,c,N}
}

func (cdl * CountDownLatch) CountDown() {  
    cdl.c.L.Lock()

      if (cdl.counter == 0) {
        violation()
      }

      cdl.counter = cdl.counter - 1

      if (cdl.counter == 0) {
        cdl.c.Broadcast()
      }

    cdl.c.L.Unlock()
}

func (cdl * CountDownLatch) Await() {  
    cdl.c.L.Lock()
      for cdl.counter != 0 {
        cdl.c.Wait()
      }
    cdl.c.L.Unlock()
}

func (cdl * CountDownLatch) CurrentCounter() int {
    var r int  
    cdl.c.L.Lock()
      r = cdl.counter      
    cdl.c.L.Unlock()    
    return r
}

// consider experimenting with workload of warying size classes
type WorkloadObject struct {  
  data int
}

func CreateObject(x int) * WorkloadObject {
  return &WorkloadObject{x}
}

func violation() {
  panic("Should not reach here!")
}

func startWorker(cdl * CountDownLatch, N int, finished * sync.WaitGroup) {
  go func(){
     cdl.CountDown()
     cdl.Await()

     workerLoop(N)

     finished.Done()
  }()
}

func workerLoop(N int) {

  // linear congruental generator
  // I suppose that it will not generate 17, ever :)
  var seed = 1013
  var m    = 22695477
  var inc  = 1

  var randomNum = seed

  var i = 0
  var objRef = CreateObject(-1) 

  for i < N {
     var tmp = CreateObject(i)

     if (randomNum == 17) {
        fmt.Println("i = ", i)

        // fake object escape
        blackHole = tmp
        blackHole = objRef
        violation()        
     } else {
        objRef = tmp
     }

     randomNum = (m * randomNum + inc) // modulo 2^32, overflow wrapping does the job for us
     i = i + 1
  }

  blackHole = objRef
}

func measure(w int, N int) {
  var cdl = CreateLatch(w + 1)
  var finished sync.WaitGroup
  finished.Add(w)

  for i := 0; i < w; i++ {
    startWorker(&cdl, N, &finished)    
  }

  // consider reworking this busy loop
  for cdl.CurrentCounter() != 1 {
    time.Sleep(1 * time.Millisecond)
  }

  var start = time.Now()
  cdl.CountDown()

  finished.Wait() // join all workers

  if (shouldLog) {
    var timeMs = time.Since(start).Milliseconds()
    fmt.Printf("%d worker threads executed %d iterations each in %d ms\n", w, N, timeMs)
    var eff = float64(w) * float64(N) / float64(timeMs)
    fmt.Printf("  Throughput           : %f units / msec\n", eff)
    fmt.Printf("  Normalized throughput: %f units / msec\n", eff / float64(w))
  }
}


