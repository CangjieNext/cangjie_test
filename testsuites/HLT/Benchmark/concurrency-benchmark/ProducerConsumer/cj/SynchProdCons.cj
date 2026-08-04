/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -iter 2000000 -threadPairs 16 %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -iter 2000000 -threadPairs 32 %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -iter 2000000 -threadPairs 64 %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -iter 2000000 -threadPairs 128 %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output -iter 2000000 -threadPairs 256 %run_args

import std.collection.*
import std.process.*
import std.convert.*
import std.sync.*
import std.time.*

var nPairs = 64
var nIter = 2000000

class Pair {
  let monIdx = AtomicInt64(0)
  let role = AtomicInt64(0)

  let monitors = [Monitor(), Monitor()]

  func notifyMon(m : Monitor) {
    synchronized(m) {
      m.notify()
    }
  }

  func test(iter: Int64) {
    let idx = monIdx.fetchAdd(1)

    let o1 = monitors[idx]
    let o2 = monitors[idx ^ 1]

    synchronized(o1) {
      let consumer = (role.fetchAdd(1) == 0)

      if (consumer) {
        for (cnt in 0..iter) {
          o1.wait()
          notifyMon(o2)      
        }
      } else {
        for (cnt in 0..iter) {
          notifyMon(o2)
          o1.wait()
        }
      }
    }
  }
}

class WorkerGroup {
  let startLatch: SyncCounter
  var workers: ArrayList<Future<Unit>>

  init(nIter: Int64, nPairs: Int64) {
    startLatch = SyncCounter(1)

    let iterForPair = nIter / nPairs

    workers = ArrayList<Future<Unit>>()

    for (i in 0..nPairs) {
      let pair = Pair()
      workers.add(spawn{ => work(iterForPair, pair) })
      workers.add(spawn{ => work(iterForPair, pair) })
    }
  }

  func execute(): Int64 {
    let startTime = DateTime.now()

    startLatch.dec()

    for (f in workers) {
      f.get()
    }

    return (DateTime.now() - startTime).toMilliseconds()
  }

  func work(iterations: Int64, pair: Pair) {
    startLatch.waitUntilZero()
    pair.test(iterations)
  }
}

func parseArgs(args: ArrayList<String>) {
  var pos = 0
  while(pos < args.size) {
    let option = args[pos]
    let value = Int64.tryParse(args[pos+1]).getOrThrow()

    if (value <= 0) {
      throw Exception()
    }

    if (option == "-iter") {
        nIter = value;
    } else if (option == "-threadPairs") {
        nPairs = value;
    } else {
        throw Exception();
    }
    pos += 2
  }
}

main(): Int64 {

  try {
      let args = Process.current.arguments
      let arr = ArrayList<String>(args)
      parseArgs(arr);
  } catch (_) {
      print("Usage: [-iter <num>] [-threadPairs <numx>]");
      return 1
  }

  println("Started: ${nIter} iterations for ${nPairs} thread pairs")
  
  WorkerGroup(20000, 2).execute() // warm-up for JITs

  let elapsedTime = WorkerGroup(nIter, nPairs).execute()

  print("Time, ms: ${elapsedTime}\n")

  return 0
}
