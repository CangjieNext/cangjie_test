/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array

import (
	"sort"
	"testing"
)

func benchmarkUnstableSortD2(b *testing.B, arrLen int){
	arr := generateArrD2(arrLen)
	b.ResetTimer()
	b.StopTimer()
	for i := 0; i < b.N; i++ {
		randomizeD2(arr)
		b.StartTimer()
		for j := 0; j < arrLen; j++ {
			sort.Ints(arr[j])
		}
		b.StopTimer()
	}
}

func benchmarkStableSortD2(b *testing.B, arrLen int){
	arr := generateArrD2(arrLen)
	b.ResetTimer()
	b.StopTimer()
	for i := 0; i < b.N; i++ {
		randomizeD2(arr)
		b.StartTimer()
		for j := 0; j < arrLen; j++ {
			sort.SliceStable(arr[j], func(x, y int) bool {
				return arr[j][x] < arr[j][y]
			})
		}
		b.StopTimer()
	}
}

func BenchmarkArrayUnstableSortD2_N32(b *testing.B)      { benchmarkUnstableSortD2(b, arrLen[0]) }
func BenchmarkArrayUnstableSortD2_N256(b *testing.B)     { benchmarkUnstableSortD2(b, arrLen[1]) }
func BenchmarkArrayUnstableSortD2_N2048(b *testing.B)    { benchmarkUnstableSortD2(b, arrLen[2]) }

func BenchmarkArrayStableSortD2_N32(b *testing.B)      { benchmarkStableSortD2(b, arrLen[0]) }
func BenchmarkArrayStableSortD2_N256(b *testing.B)     { benchmarkStableSortD2(b, arrLen[1]) }
func BenchmarkArrayStableSortD2_N2048(b *testing.B)    { benchmarkStableSortD2(b, arrLen[2]) }
