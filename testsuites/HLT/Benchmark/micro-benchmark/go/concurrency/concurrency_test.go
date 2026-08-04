/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package atomic_test

import (
	"fmt"
	"os"
	"runtime"
	"strconv"
	. "sync"
	"testing"
)

func benchmarkReschedule(b *testing.B, threads int) {
	var wg WaitGroup
	wg.Add(threads)
	for i := 0; i < threads; i++ {
		go func() {
			for j := 0; j < b.N; j++ {
				runtime.Gosched()
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkRescheduleThread1(b *testing.B)   { benchmarkReschedule(b, 1) }
func BenchmarkRescheduleThread2(b *testing.B)   { benchmarkReschedule(b, 2) }
func BenchmarkRescheduleThread4(b *testing.B)   { benchmarkReschedule(b, 4) }
func BenchmarkRescheduleThread8(b *testing.B)   { benchmarkReschedule(b, 8) }
func BenchmarkRescheduleThread16(b *testing.B)  { benchmarkReschedule(b, 16) }
func BenchmarkRescheduleThread32(b *testing.B)  { benchmarkReschedule(b, 32) }
func BenchmarkRescheduleThread64(b *testing.B)  { benchmarkReschedule(b, 64) }
func BenchmarkRescheduleThread128(b *testing.B) { benchmarkReschedule(b, 128) }

func benchmarkSubmit(b *testing.B, oneProcessor bool, threads int) {
	if oneProcessor {
		runtime.GOMAXPROCS(1)
	} else {
		threads *= runtime.NumCPU()
	}
	for i := 0; i < b.N; i++ {
		for j := 0; j < threads; j++ {
			go func() {
			}()
		}
	}
}

func benchmarkRunning(b *testing.B, oneProcessor bool, threads int) {
	if oneProcessor {
		runtime.GOMAXPROCS(1)
	} else {
		threads *= runtime.NumCPU()
	}
	var wg WaitGroup
	for i := 0; i < b.N; i++ {
		wg.Add(threads)
		for j := 0; j < threads; j++ {
			go func() {
				wg.Done()
			}()
		}
		wg.Wait()
	}
}

func BenchmarkSubmit1ProcessorThread1000(b *testing.B)  { benchmarkSubmit(b, true, 1000) }
// func BenchmarkSubmitNProcessorThread1000(b *testing.B) { benchmarkSubmit(b, false, 1000) }

func BenchmarkRunning1ProcessorThread1000(b *testing.B)  { benchmarkRunning(b, true, 1000) }
func BenchmarkRunningNProcessorThread1000(b *testing.B) { benchmarkRunning(b, false, 1000) }

func removeAllIOInstensiveTestFiles(tasks int) {
	for i := 0; i < tasks; i++ {
		os.Remove("temp" + strconv.Itoa(i) + ".txt")
	}
}

func benchmarkIOInstensive(b *testing.B, tasks int, threads int) {
	bytes := make([]byte, 1024*100)
	for k := range bytes {
		bytes[k] = 'B'
	}
	removeAllIOInstensiveTestFiles(tasks)
	for k := 0; k < b.N; k++ {
		var wg WaitGroup
		wg.Add(tasks)
		for i := 0; i < threads; i++ {
			go func(i int) {
				for j := 0; j < tasks/threads; j++ {
					file, err := os.Create("temp" + strconv.Itoa(j*threads+i) + ".txt")
					if err != nil {
						fmt.Println("Open file err =", err)
						return
					}
					defer file.Close()
					_, err = file.Write(bytes)
					if err != nil {
						fmt.Println("Write file err =", err)
						return
					}
					wg.Done()
				}
			}(i)
		}
		wg.Wait()
		removeAllIOInstensiveTestFiles(tasks)
	}
}

func BenchmarkIOInstensiveThread1(b *testing.B)    { benchmarkIOInstensive(b, 1000, 1) }
func BenchmarkIOInstensiveThread10(b *testing.B)   { benchmarkIOInstensive(b, 1000, 10) }
func BenchmarkIOInstensiveThread100(b *testing.B)  { benchmarkIOInstensive(b, 1000, 100) }
func BenchmarkIOInstensiveThread1000(b *testing.B) { benchmarkIOInstensive(b, 1000, 1000) }

func benchmarkCPUIntensive(b *testing.B, tasks int, threads int) {
	for k := 0; k < b.N; k++ {
		var wg WaitGroup
		wg.Add(threads)
		for i := 0; i < threads; i++ {
			go func() {
				sum := 0
				for j := 0; j < tasks/threads; j++ {
					sum += j * j
				}
				wg.Done()
			}()
		}
		wg.Wait()
	}
}

func BenchmarkCPUIntensiveThread1(b *testing.B)    { benchmarkCPUIntensive(b, 1000000, 1) }
func BenchmarkCPUIntensiveThread10(b *testing.B)   { benchmarkCPUIntensive(b, 1000000, 10) }
func BenchmarkCPUIntensiveThread100(b *testing.B)  { benchmarkCPUIntensive(b, 1000000, 100) }
func BenchmarkCPUIntensiveThread1000(b *testing.B) { benchmarkCPUIntensive(b, 1000000, 1000) }

func benchmarkLock(b *testing.B, threads int) {
	var wg WaitGroup
	wg.Add(threads)
	lock := &Mutex{}
	for i := 0; i < threads; i++ {
		go func() {
			for j := 0; j < b.N; j++ {
				lock.Lock()
				lock.Unlock()
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkLockThread1(b *testing.B)   { benchmarkLock(b, 1) }
func BenchmarkLockThread10(b *testing.B)  { benchmarkLock(b, 10) }
func BenchmarkLockThread100(b *testing.B) { benchmarkLock(b, 100) }

func createNGoroutine(b *testing.B, num int) {
	for i := 0; i < b.N; i++ {
		for j := 0; j < num; j++ {
			go func() {}()
		}

	}
}

func BenchmarkThreadCreateThread64(b *testing.B)    { createNGoroutine(b, 64) }
func BenchmarkThreadCreateThread128(b *testing.B)   { createNGoroutine(b, 128) }
func BenchmarkThreadCreateThread256(b *testing.B)   { createNGoroutine(b, 256) }
func BenchmarkThreadCreateThread512(b *testing.B)   { createNGoroutine(b, 512) }
func BenchmarkThreadCreateThread1024(b *testing.B)  { createNGoroutine(b, 1024) }
func BenchmarkThreadCreateThread2048(b *testing.B)  { createNGoroutine(b, 2048) }
func BenchmarkThreadCreateThread4096(b *testing.B)  { createNGoroutine(b, 4096) }
func BenchmarkThreadCreateThread8192(b *testing.B)  { createNGoroutine(b, 8192) }
func BenchmarkThreadCreateThread10000(b *testing.B) { createNGoroutine(b, 10000) }
func BenchmarkConditionThread1(b *testing.B) {
	conds := make([]*Cond, b.N)
	vars := make([]int, b.N)
	for i := 0; i < b.N; i++ {
		conds[i] = NewCond(new(Mutex))
	}
	go func() {
		for i := 0; i < b.N; i++ {
			conds[i].L.Lock()
			vars[i] = b.N
			conds[i].Signal()
			conds[i].L.Unlock()
		}
	}()
	for i := 0; i < b.N; i++ {
		conds[i].L.Lock()
		for vars[i] != b.N {
			conds[i].Wait()
		}
		conds[i].L.Unlock()
	}
}
