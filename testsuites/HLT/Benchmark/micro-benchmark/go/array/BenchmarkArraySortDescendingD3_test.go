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

func benchmarkSortDescendingD3(b *testing.B, arrLen int){
	arr := generateArrD3(arrLen)
	b.ResetTimer()
	b.StopTimer()
	for i := 0; i < b.N; i++ {
		randomizeD3(arr)
		b.StartTimer()
		for j := 0; j < arrLen; j++ {
			for k := 0; k < arrLen; k++ {
				sort.SliceStable(arr[j][k], func(x, y int) bool {
					return arr[j][k][x] > arr[j][k][y]
				})
			}
		}
		b.StopTimer()
	}
}

func BenchmarkArraySortDescendingD3_N32(b *testing.B)      { benchmarkSortDescendingD3(b, arrLen[0]) }
func BenchmarkArraySortDescendingD3_N256(b *testing.B)     { benchmarkSortDescendingD3(b, arrLen[1]) }
