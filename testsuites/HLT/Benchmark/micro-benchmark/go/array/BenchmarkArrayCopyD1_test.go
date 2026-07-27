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

func benchmarkD1CopyRun(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for j, v := range arr {
		arr[j] = v + 1
	}
	dst := make([]int, arrLen)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		copy(dst, arr)
	}
}

func BenchmarkArrayCopyD1_N32(b *testing.B)      { benchmarkD1CopyRun(b, arrLen[0]) }
func BenchmarkArrayCopyD1_N256(b *testing.B)     { benchmarkD1CopyRun(b, arrLen[1]) }
func BenchmarkArrayCopyD1_N2048(b *testing.B)    { benchmarkD1CopyRun(b, arrLen[2]) }
func BenchmarkArrayCopyD1_N16384(b *testing.B)   { benchmarkD1CopyRun(b, arrLen[3]) }
func BenchmarkArrayCopyD1_N131072(b *testing.B)  { benchmarkD1CopyRun(b, arrLen[4]) }
func BenchmarkArrayCopyD1_N1048576(b *testing.B) { benchmarkD1CopyRun(b, arrLen[5]) }
func BenchmarkArrayCopyD1_N8388608(b *testing.B) { benchmarkD1CopyRun(b, arrLen[6]) }