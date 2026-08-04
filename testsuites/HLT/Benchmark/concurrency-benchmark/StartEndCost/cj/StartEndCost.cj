/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %export cjHeapSize=128mb && %run %run_opt %output 4000000 %run_args

import std.collection.*
import std.process.*
import std.convert.*
import std.sync.*
import std.time.*

class CompletableFuture {
  let lock = Monitor()
  var completed: Bool
  var result: DateTime 
  
  init() {
    completed = false
    result = DateTime.now() // unused
  }

  func await() {
    synchronized (lock) {
      while (!completed) {
        lock.wait()
      } 
    }
    result
  }

  func done(val: DateTime ) {
    synchronized (lock) {
      completed = true
      result = val
      lock.notifyAll()
    }
  }
}

func create(n: Int64, finisher: CompletableFuture): Unit {
  spawn { =>
    if (n == 0) {
      let t = DateTime.now()
      finisher.done(t)
    } else {
      create(n - 1, finisher)
    }
  }
}

func measure(depth: Int64): Int64 {
  let finisher = CompletableFuture()
  
  let start = DateTime.now()
  create(depth, finisher)

  let end = finisher.await()

  return (end - start).toMilliseconds()
}

func print(pref: String, depth: Int64) {
  let res = measure(depth)

  println("${pref} ${res}")
}

main(): Int64 {
  let args = Process.current.arguments
  let depth = Int64.tryParse(args[0]).getOrThrow()

  print("warmup", depth);

  sleep(Duration.millisecond * 10)
  
  print("result", depth);
  0
}
