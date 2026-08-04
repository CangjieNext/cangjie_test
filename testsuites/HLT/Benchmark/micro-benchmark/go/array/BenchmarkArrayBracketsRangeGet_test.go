/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array

import (
	"testing"
)

var data1 int
func benchmarkBracketsRangeGetRunD1(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for i := 0; i < arrLen; i++ {
		arr[i] = i
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		element := arr[0:arrLen/2]
		data1 = element[0]
	}
}

func BenchmarkArrayBracketsRangeGetD1_N32(b *testing.B)      { benchmarkBracketsRangeGetRunD1(b, 32) }
func BenchmarkArrayBracketsRangeGetD1_N256(b *testing.B)     { benchmarkBracketsRangeGetRunD1(b, 256) }
func BenchmarkArrayBracketsRangeGetD1_N2048(b *testing.B)    { benchmarkBracketsRangeGetRunD1(b, 2048) }
func BenchmarkArrayBracketsRangeGetD1_N1048576(b *testing.B) { benchmarkBracketsRangeGetRunD1(b, 1048576) }