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
	"strconv"
)

func benchmarkD1CopyRun_Int64(b *testing.B, arrLen int) {
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

func BenchmarkArrayCopyTo_Int64_D1_N32(b *testing.B)      { benchmarkD1CopyRun_Int64(b, arrLen[0]) }
func BenchmarkArrayCopyTo_Int64_D1_N2048(b *testing.B)    { benchmarkD1CopyRun_Int64(b, arrLen[2]) }
func BenchmarkArrayCopyTo_Int64_D1_N131072(b *testing.B)  { benchmarkD1CopyRun_Int64(b, arrLen[4]) }
func BenchmarkArrayCopyTo_Int64_D1_N8388608(b *testing.B) { benchmarkD1CopyRun_Int64(b, arrLen[6]) }

func benchmarkD1CopyRun_String(b *testing.B, arrLen int) {
	arr := make([]string, arrLen)
	for j := range arr {
		arr[j] = strconv.Itoa(j)
	}
	dst := make([]string, arrLen)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		copy(dst, arr)
	}
}

func BenchmarkArrayCopyTo_String_D1_N32(b *testing.B)      { benchmarkD1CopyRun_String(b, arrLen[0]) }
func BenchmarkArrayCopyTo_String_D1_N2048(b *testing.B)    { benchmarkD1CopyRun_String(b, arrLen[2]) }
func BenchmarkArrayCopyTo_String_D1_N131072(b *testing.B)  { benchmarkD1CopyRun_String(b, arrLen[4]) }
func BenchmarkArrayCopyTo_String_D1_N8388608(b *testing.B) { benchmarkD1CopyRun_String(b, arrLen[6]) }