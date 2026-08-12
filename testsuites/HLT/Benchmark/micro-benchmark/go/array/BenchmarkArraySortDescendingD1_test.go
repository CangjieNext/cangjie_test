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

func benchmarkSortDescendingD1(b *testing.B, arrLen int){
	arr := generateArrD1(arrLen)
	b.ResetTimer()
	b.StopTimer()
	for i := 0; i < b.N; i++ {
		randomizeD1(arr)
		b.StartTimer()
		sort.SliceStable(arr, func(x, y int) bool {
			return arr[x] > arr[y]
		})
		b.StopTimer()
	}
}

func BenchmarkArraySortDescendingD1_N32(b *testing.B)      { benchmarkSortDescendingD1(b, arrLen[0]) }
func BenchmarkArraySortDescendingD1_N256(b *testing.B)     { benchmarkSortDescendingD1(b, arrLen[1]) }
func BenchmarkArraySortDescendingD1_N2048(b *testing.B)    { benchmarkSortDescendingD1(b, arrLen[2]) }
func BenchmarkArraySortDescendingD1_N16384(b *testing.B)   { benchmarkSortDescendingD1(b, arrLen[3]) }
func BenchmarkArraySortDescendingD1_N131072(b *testing.B)  { benchmarkSortDescendingD1(b, arrLen[4]) }
func BenchmarkArraySortDescendingD1_N1048576(b *testing.B) { benchmarkSortDescendingD1(b, arrLen[5]) }
func BenchmarkArraySortDescendingD1_N8388608(b *testing.B) { benchmarkSortDescendingD1(b, arrLen[6]) }
