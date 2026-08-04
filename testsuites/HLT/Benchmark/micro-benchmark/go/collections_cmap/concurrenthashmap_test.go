/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_concurrenthashmap

import (
	"math/rand"
	"testing"
	"sync"
)

func benchmarkCHM_PutElement(b *testing.B, thread int, tasks int) {
	for i := 0; i < b.N ; i++ {
		syncMap := sync.Map{}
		wg := sync.WaitGroup{}
		wg.Add(thread)
		for i := 0; i < thread; i++ {
			go func() {
				for j := 0; j < tasks; j++ {
					syncMap.Store(rand.Int63(), j)
				}
				wg.Done()
			}()
		}
		wg.Wait()
	}
}

func BenchmarkCHM_PutElement_Thread_4(b *testing.B)    {benchmarkCHM_PutElement(b, 4, 10000)}
func BenchmarkCHM_PutElement_Thread_8(b *testing.B)    {benchmarkCHM_PutElement(b, 8, 10000)}
func BenchmarkCHM_PutElement_Thread_16(b *testing.B)    {benchmarkCHM_PutElement(b, 16, 10000)}
func BenchmarkCHM_PutElement_Thread_32(b *testing.B)    {benchmarkCHM_PutElement(b, 32, 10000)}
func BenchmarkCHM_PutElement_Thread_256(b *testing.B)    {benchmarkCHM_PutElement(b, 256, 10000)}
func BenchmarkCHM_PutElement_Thread_1024(b *testing.B)    {benchmarkCHM_PutElement(b, 1024, 10000)}

func benchmarkCHM_UpdateElement(b *testing.B, thread int, ops int) {
	for i := 0; i < b.N ; i++ {
		syncMap := sync.Map{}
		wg := sync.WaitGroup{}
		wg.Add(thread)
		for i := 0; i < thread; i++ {
			go func() {
				k := (i + 1573) & 127
				for j := 0; j < ops / thread; j++ {
					_, ok := syncMap.LoadOrStore(k, 1)
					switch ok {
					case false :
					case true :
						syncMap.Swap(k, k + j + 1)
					}
					k = (k + 7) & 127
				}
				wg.Done()
			}()
		}
		wg.Wait()
	}
}

func BenchmarkCHM_UpdateElement_Thread_4(b *testing.B)    {benchmarkCHM_UpdateElement(b, 4, 1024 * 1024 * 16)}
func BenchmarkCHM_UpdateElement_Thread_8(b *testing.B)    {benchmarkCHM_UpdateElement(b, 8, 1024 * 1024 * 16)}
func BenchmarkCHM_UpdateElement_Thread_16(b *testing.B)    {benchmarkCHM_UpdateElement(b, 16, 1024 * 1024 * 16)}
func BenchmarkCHM_UpdateElement_Thread_32(b *testing.B)    {benchmarkCHM_UpdateElement(b, 32, 1024 * 1024 * 16)}
func BenchmarkCHM_UpdateElement_Thread_256(b *testing.B)    {benchmarkCHM_UpdateElement(b, 256, 1024 * 1024 * 16)}
func BenchmarkCHM_UpdateElement_Thread_1024(b *testing.B)    {benchmarkCHM_UpdateElement(b, 1024, 1024 * 1024 * 16)}