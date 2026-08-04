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

func benchmarkSortDescendingD2(b *testing.B, arrLen int){
	arr := generateArrD2(arrLen)
	b.ResetTimer()
	b.StopTimer()
	for i := 0; i < b.N; i++ {
		randomizeD2(arr)
		b.StartTimer()
		for j := 0; j < arrLen; j++ {
			sort.SliceStable(arr[j], func(x, y int) bool {
				return arr[j][x] > arr[j][y]
			})
		}
		b.StopTimer()
	}
}

func BenchmarkArraySortDescendingD2_N32(b *testing.B)      { benchmarkSortDescendingD2(b, arrLen[0]) }
func BenchmarkArraySortDescendingD2_N256(b *testing.B)     { benchmarkSortDescendingD2(b, arrLen[1]) }
func BenchmarkArraySortDescendingD2_N2048(b *testing.B)    { benchmarkSortDescendingD2(b, arrLen[2]) }
