/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output preempt %run_args
// RUN-EXEC: export cjProcessorNum=32 && export JETVMPROP="-Djet.cj.use.fibers -Djet.fiber.carrier.count=32 -Djet.fiber.syscalls.control.disable=true" && %run %run_opt %output enmasse %run_args

import std.collection.*
import std.process.*
import std.convert.*
import std.sync.*
import std.time.*

var light: Int32 = 0 
var heavy: Int32 = 0
var threads: Int32 = 0
let lightprime: Int32 = 60_000
let heavyprime: Int32 = 120_000_000

let verbose: Bool = false

@OverflowWrapping
func blackhole(v: Int32): Int64 {
  // Should be unoptimizable by compilers payload.
  // 
  // Seems like xorshift64 prng `k` steps are hard to generate
  // faster than just execution of `k` steps.

  let m = UInt64(v)
  let p: UInt64 = 1000 * 1000 * 1000 + 7
  var x = UInt64(v)

  var s = UInt64(0)
  while (true) {
    // Countable loop deoptimization 
    s = (s + p) % m
    if (s == 0) {
      break
    }
    

    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;

    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;

    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;

    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;

    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;

    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;

    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;
  }
  Int64(x)
}

class Data {
  var beg: Int64 = 0
  var end: Int64 = 0
  var prime: Int64 = 0
  var isHeavy: Bool = false
}

let point = DateTime.now()

func initialize(lightstarter: SyncCounter, heavystarter: SyncCounter, ready: SyncCounter, finish: SyncCounter): Array<Option<Data>> {
  var j: Int32 = 0
  let arr: Array<Option<Data>> = Array<Option<Data>>(Int64(threads), repeat: None<Data>)
  while (j < threads) {
    let i = Int64(j)
    let iters = if (j < heavy) { heavyprime + j } else { lightprime + j % 100 }
    let starter = if (j < heavy) { heavystarter } else { lightstarter }
    let d = Data()
    arr[i] = Some(d)
    d.isHeavy = j < heavy
    let atomic = AtomicInt32(iters)

    spawn { =>
      ready.dec()
      starter.waitUntilZero()
      let b = DateTime.now()
      d.beg = (b - point).toMilliseconds()

      d.prime = blackhole(atomic.load())

      let e = DateTime.now()
      d.end = (e - point).toMilliseconds()

      finish.dec()
    }
    j++
  }
  arr
}

func measure(): Float64 {
  let lightstarter: SyncCounter = SyncCounter(1)
  let heavystarter: SyncCounter = SyncCounter(1)
  let ready: SyncCounter = SyncCounter(Int64(light + heavy))
  let finish: SyncCounter = SyncCounter(Int64(light + heavy))

  let ds = initialize(lightstarter, heavystarter, ready, finish)

  // wait till all fibers reach starter latch
  ready.waitUntilZero()

  let start = (DateTime.now() - point).toMilliseconds()
  heavystarter.dec()
  sleep(Duration.millisecond)
  lightstarter.dec()
  finish.waitUntilZero()

  var exec = 0
  var sum = 0
  var cnt = 0
  var verify: Int64 = 0
  for (od in ds) {
    let d = od.getOrThrow()
    if (d.isHeavy) {
      let qqq = d.end - start
      continue
    }
    let d1 = d.end - d.beg
    let d2 = d.end - start
    
    if (verbose) {
        println("${d1} ${d2}")
    }

    exec += (d.end - d.beg)
    sum += (d.end - start)

    verify += d.prime
    cnt += 1
  }

  let execavg = Float64(exec) / Float64(cnt)
  println("${execavg}, verify=${verify}")

  Float64(sum) / Float64(cnt)
}

func print(pref: String) {
  var t: Float64 = 0.0

  t += measure()
  t += measure()
  t += measure()
  t += measure()

  t /= 4.0

  println("${pref} ${t}") 
}

// set global variable: light, heavy, threads
func parseArgs() {
  let args = Process.current.arguments
  let mode = args[0]
  if (mode == "preempt") {
    light = 2000
    heavy = 4
  } else if (mode == "enmasse"){
    light = 10000
    heavy = 0
  } else {
    throw IllegalArgumentException()
  }
  if (args.size > 1) {
    light = Int32.tryParse(args[1]).getOrThrow()
  }
  if (args.size > 2) {
    heavy = Int32.tryParse(args[2]).getOrThrow()
    if (mode == "enmasse" && heavy != 0) {
      throw IllegalArgumentException()
    }
  }
  threads = light + heavy
}

main(): Int64 {
  parseArgs()
  let f = spawn {
    print("warmup");
    print("result");
  }
  f.get()
  0
}
