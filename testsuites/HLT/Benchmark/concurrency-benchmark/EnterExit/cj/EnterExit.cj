/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -biased %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -bacon %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -mon-uncontended %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -mon-contended -threads 16 %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -mon-contended -threads 32 %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -mon-contended -threads 64 %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -mon-contended -threads 128 %run_args

import std.collection.*
import std.process.*
import std.convert.*
import std.sync.*
import std.time.*
import std.runtime.GC

enum Mode {
  BIASED_LOCKING | BACON_BITS | MONITOR_UNCONTENDED | MONITOR_CONTENDED
}

let FACTOR = 100

var mode           = Mode.BIASED_LOCKING
var nThreads       = 1
var problemSize    = 700000
var nSlicesForStat = 0

var hide: AtomicReference<Monitor> = AtomicReference<Monitor>(Monitor())

class Matrix {
  var data: Array<Array<Int64>>
  var time: Int64 = 0
  var maxTime: Int64

  // ownership stat
  var lastEnteredId: Int64 = -1  // invalid
  var ownerChanges: Int64 = -1
  var timeSlice: Int64 = -1
  var ownershipDistrib: Array<Array<Int64>> = Array<Array<Int64>>()

  init(nJobs: Int64, jobLength: Int64, nStatSlices: Int64) {
    this.data = Array<Array<Int64>>(nJobs, repeat: Array<Int64>(jobLength, repeat: 0))
    this.maxTime = nJobs * jobLength * FACTOR

    if (nStatSlices != 0) {
      this.ownershipDistrib = Array<Array<Int64>>(nStatSlices, {i => Array<Int64>(nJobs, {j => 0})})
      this.timeSlice = this.maxTime / nStatSlices
    }
  }

  func postValidate() {
    if (this.time != this.maxTime) {
      print("Validation failed: expected ${this.maxTime} got ${this.time}\n")
      throw Exception()
    }
  }
}

func work(id: Int64, m: Matrix, monitor: Monitor, start: SyncCounter, ready: SyncCounter, finish: SyncCounter) {
  ready.dec()
  start.waitUntilZero()

  for (cnt in 0..FACTOR) {
    let len = m.data[id].size
    for (i in 0..len) {
      synchronized(monitor) {
        m.data[id][i] = id + i
        let changed = (m.lastEnteredId != id)
        if (changed) {
          m.ownerChanges++
          m.lastEnteredId = id
        }
        if (nSlicesForStat != 0) {
          let slice: Int64 = m.time / m.timeSlice
          m.ownershipDistrib[slice][id]+=1
        }
        m.time++;
      }
    }
  }

  finish.dec()
  finish.waitUntilZero()
}

func initMonitorUncontended(monitor: Monitor) {
  let latch = SyncCounter(1)
  spawn {
    synchronized(monitor) {
      latch.dec()
      while(true) {
        // Under laboratory conditions of benchmark system this wait should not spuriously wake up.
        monitor.wait()
      }
    }
  }
  latch.waitUntilZero()
  // Wait a bit to prevent interference of newly created thread.
  sleep(500 * Duration.millisecond)
}

func bench(toPrint: Bool, sizeForAll: Int64) {
  match (mode) {
    case MONITOR_CONTENDED =>
      if (nThreads == 1) {
        print("You opted for contended mode: thread number must be > 1\n")
        throw Exception()
      }
    case _ =>
      nThreads = 1
  }

  let m = Matrix(nThreads, sizeForAll / nThreads, nSlicesForStat)
  hide.store(Monitor())
  let monitor = hide.load()

  match (mode) {
    case BACON_BITS =>
      synchronized(monitor){}
    case MONITOR_UNCONTENDED =>
      initMonitorUncontended(monitor)
    case _ =>
      ()
  }

  let start = SyncCounter(1)
  let ready = SyncCounter(nThreads)
  let finish = SyncCounter(nThreads)

  let workers = ArrayList<Future<Unit>>()

  for(i in 0..nThreads) {
    let fut = spawn { =>
      work(i, m, monitor, start, ready, finish)
    }
    workers.add(fut)
  }

  GC()

  ready.waitUntilZero()
  let startTime = DateTime.now()
  start.dec()
  finish.waitUntilZero()
  
  let time = (DateTime.now() - startTime).toMilliseconds()
  m.postValidate()

  if (toPrint) {
    if (nSlicesForStat != 0) {
      print("Ownership distribution:\n")
      for (slice in 0..nSlicesForStat) {
        print("|")
        for (i in 0..nThreads) {
          print(" ${m.ownershipDistrib[slice][i]} |")
        }
        print("\n")
      }
    }

    print("Ownership changes: ${m.ownerChanges}\n")
    print("Time (workers = ${nThreads} size = ${sizeForAll}): ${time}\n")
  }
}

func parseArgs(args: ArrayList<String>): Unit {
  var pos = 0
  while (pos < args.size) {
    let option = args[pos]
    if (option == "-biased") {
        mode = Mode.BIASED_LOCKING;
        pos++
        continue;
    } else if (option == "-bacon") {
        mode = Mode.BACON_BITS;
        pos++
        continue;
    } else if (option == "-mon-uncontended") {
        mode = Mode.MONITOR_UNCONTENDED;
        pos++
        continue;
    } else if (option == "-mon-contended") {
        mode = Mode.MONITOR_CONTENDED;
        pos++
        continue;
    }

    pos++
    let a = Int64.tryParse(args[pos])
    let value = Int64.tryParse(args[pos]).getOrThrow()
    if (value <= 0) {
      throw Exception()
    }

    if (option == "-size") {
      problemSize = value;
    } else if (option == "-threads") {
      nThreads = value;
    } else if (option == "-scheduling-stat") {
      nSlicesForStat = value;
    } else {
      throw Exception();
    }
    pos++
  }
}

main(): Int64 {
  try {
    let args = Process.current.arguments
    let arr = ArrayList<String>(args)
    parseArgs(arr)
  } catch (_) {
    print("Usage: -biased | -bacon | -mon-uncontended | -mon-contended [-size <value>] [-threads <num of threads>] [-scheduling-stat <num of slices>]\n")
    return 1
  }

  bench(false, 5000);
  bench(true, problemSize);
  
  return 0;
}
