/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
	"errors"
	"fmt"
	"log"
	"os"
	"strconv"
	"sync"
	"time"
)

const (
	lightprime int32 = 60 * 1000
	heavyprime int32 = 120 * 1000 * 1000
	verbose    bool  = true
)

var light int32 = 0
var heavy int32 = 0
var threads int32 = 1

func isPrime(v int64) bool {
	if v%2 == 0 {
		return false
	}

	var i int64 = 3
	for i*i <= v {
		if v%i == 0 {
			return false
		}
		i += 2
	}

	return true
}

func blackhole(v int32) int64 {
	// Should be unoptimizable by compilers payload.
	//
	// Seems like xorshift64 prng `k` steps are hard to generate
	// faster than just execution of `k` steps.
	var x uint64

	var p uint64 = 1000*1000*1000 + 7
	var m = uint64(v)

	var s uint64 = 0
	for true {
		// Countable loop deoptimization
		s = (s + p) % m
		if s == 0 {
			break
		}
		x ^= x << 13
		x ^= x >> 7
		x ^= x << 17

		x ^= x << 13
		x ^= x >> 7
		x ^= x << 17

		x ^= x << 13
		x ^= x >> 7
		x ^= x << 17

		x ^= x << 13
		x ^= x >> 7
		x ^= x << 17

		x ^= x << 13
		x ^= x >> 7
		x ^= x << 17

		x ^= x << 13
		x ^= x >> 7
		x ^= x << 17

		x ^= x << 13
		x ^= x >> 7
		x ^= x << 17
	}
	return int64(x)
}

type Data struct {
	beg     int64
	end     int64
	prime   int64
	isHeavy bool
}

func initialize(lightStarter *sync.WaitGroup, heavyStarter *sync.WaitGroup, ready *sync.WaitGroup, finish *sync.WaitGroup) []*Data {
	var j int32 = 0
	arr := make([]*Data, threads)
	for ; j < threads; j++ {
		i := j
		var iters int32
		var starter *sync.WaitGroup
		if i < heavy {
			iters = heavyprime + i
			starter = heavyStarter
		} else {
			iters = lightprime + j%100
			starter = lightStarter
		}

		var data Data
		d := &data
		arr[i] = d
		data.isHeavy = i < heavy

		go func() {
			ready.Done()
			starter.Wait()

			d.beg = time.Now().UnixMilli()
			d.prime = blackhole(iters)
			d.end = time.Now().UnixMilli()

			finish.Done()
		}()
	}
	return arr
}

func measure() float64 {
	var lightStarter sync.WaitGroup
	var heavyStarter sync.WaitGroup
	var finish sync.WaitGroup
	var ready sync.WaitGroup

	ready.Add(int(threads))
	finish.Add(int(threads))
	heavyStarter.Add(1)
	lightStarter.Add(1)

	ds := initialize(&lightStarter, &heavyStarter, &ready, &finish)
	ready.Wait()

	start := time.Now().UnixMilli()
	heavyStarter.Done()
	time.Sleep(1 * time.Millisecond)
	lightStarter.Done()

	finish.Wait()

	var exec int64 = 0
	var sum int64 = 0
	var cnt int64 = 0
	for j := int32(0); j < threads; j++ {
		var d = ds[j]
		if d.isHeavy {
			continue
		}

		exec += d.end - d.beg
		sum += d.end - start
		cnt += 1
	}

	if verbose {
		fmt.Println(float64(exec) / float64(cnt))
	}

	return float64(sum) / float64(cnt)
}

func print(pref string) {
	var t float64 = 0.0

	t += measure()
	t += measure()
	t += measure()
	t += measure()

	t /= 4.0

	fmt.Println(pref, t)
}

func parseArgs() error {
	args := os.Args
	mode := args[1]
	if mode == "preempt" {
		light = 2000
		heavy = 4
	} else if mode == "enmasse" {
		light = 10000
		heavy = 0
	} else {
		return errors.New("IllegalArgument")
	}
	if len(args) > 2 {
		t, _ := strconv.Atoi(args[2])
		light = int32(t)
	}
	if len(args) > 3 {
		t, _ := strconv.Atoi(args[3])
		heavy = int32(t)
    if mode == "enmasse" && heavy != 0 {
		  return errors.New("IllegalArgument")
    }
	}
	threads = light + heavy
	return nil
}

func main() {
	err := parseArgs()
	if err != nil {
		log.Fatal(err)
	}
	print("warmup")
	print("result")
}
