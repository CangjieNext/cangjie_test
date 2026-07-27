/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: %export cjHeapSize=1gb && %export JETVMPROP="-Djet.gc.heaplimit=1g" && %run %run_opt %output 100000000 1 3 %run_args
// RUN-EXEC: %export cjHeapSize=1gb && %export JETVMPROP="-Djet.gc.heaplimit=1g" && %run %run_opt %output 100000000 8 3 %run_args
// RUN-EXEC: %export cjHeapSize=1gb && %export JETVMPROP="-Djet.gc.heaplimit=1g" && %run %run_opt %output 100000000 16 3 %run_args 2>&1 | compare %f
// RUN-EXEC: %export cjHeapSize=1gb && %export JETVMPROP="-Djet.gc.heaplimit=1g" && %run %run_opt %output 100000000 32 3 %run_args 2>&1 | compare %f
// ASSERT: regex Throughput | Out of memory
// TIMEOUT: 600

import std.sync.*
import std.convert.*
import std.collection.*
import std.time.*

var shouldLog = false
var blackBox = WorkloadObject(-1)

class CountDownLatch {
  let m = Monitor()
  var counter = 0

  init(N : Int64) {
    counter = N
  }

  func countDown() {
    synchronized(m) {
      if (counter == 0) {
        violation()
      }

      counter = counter - 1

      if (counter == 0) {
        m.notifyAll()
      }
    }
  }

  func await() {
    synchronized(m) {
      while(counter != 0) {
        m.wait()
      }
    }
  }

  func currentCounter() {
    synchronized(m) {
      return counter
    }
  }
}

// consider experimenting with workload of warying size classes
class WorkloadObject {
  let data: Int64

  init(x : Int64) {
    data = x
  }
}

func violation() {
  throw Exception("Should not reach here!")
}

func startWorker(cdl: CountDownLatch, N: Int64) {
  let f: Future<Unit> = spawn {
     cdl.countDown()
     cdl.await()

     workerLoop(N)
  }

  return f
}

@OverflowWrapping
func workerLoop(N: Int64) {

  // linear congruental generator
  // I suppose that it will not generate 17, ever :)
  let seed: Int32 = 1013
  let m: Int32    = 22695477
  let inc: Int32  = 1

  var randomNum: Int32 = seed

  var i = 0
  var objRef = WorkloadObject(-1)
  while(i < N) {
     let tmp = WorkloadObject(i)

     if (randomNum == 17) {
        println("i = ${i}")

        // fake object escape
        blackBox = tmp
        blackBox = objRef
        violation()
     } else {
        objRef = tmp
     }

     randomNum = (m * randomNum + inc) // modulo 2^32, overflow wrapping does the job for us
     i = i + 1
  }

  blackBox = objRef
}

func measure(w: Int64, N: Int64): Unit {
  let cdl = CountDownLatch(w + 1)
  let workers = ArrayList<Future<Unit>>()
  for (i in 0..w) {
    let f = startWorker(cdl, N)
    workers.add(f)
  }

  // consider reworking this busy loop
  while(cdl.currentCounter() != 1) {
    sleep(Duration.millisecond)
  }

  let start = DateTime.now()
  cdl.countDown()
  for (f in workers) {
    f.get() // join all workers
  }

  let end = DateTime.now()

  if (shouldLog) {
    let timeMs = (end - start).toMilliseconds()
    println("${w} worker threads executed ${N} iterations each in ${timeMs} ms")
    let eff = Float64(w * N) / Float64(timeMs)
    println("  Throughput           : ${eff} units / msec")
    println("  Normalized throughput: ${eff / Float64(w)} units / msec")
  }
}

main(args: Array<String>): Unit {

    if (args.size != 3) {
        println("Usage: program <iterations.per.thread> <threads> <total.repeats>")
        return
    }

    let N = Int64.tryParse(args[0]) ?? Int64(0)
    let W = Int64.tryParse(args[1]) ?? Int64(0)
    let R = Int64.tryParse(args[2]) ?? Int64(0)

    println("Warmup phase...")
    shouldLog = false
    measure(W, 100000)

    println("Measurements...")
    shouldLog = true
    for (i in 0..R) {
      measure(W, N)
    }
}
