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
var data int =  0
func benchmarkRun(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
		arr := make([]int, arrLen)
		data = arr[0]
	}
}

func BenchmarkArrayInitializationD1_N32(b *testing.B)      { benchmarkRun(b, arrLen[0]) }
func BenchmarkArrayInitializationD1_N256(b *testing.B)     { benchmarkRun(b, arrLen[1]) }
func BenchmarkArrayInitializationD1_N2048(b *testing.B)    { benchmarkRun(b, arrLen[2]) }
func BenchmarkArrayInitializationD1_N16384(b *testing.B)   { benchmarkRun(b, arrLen[3]) }
func BenchmarkArrayInitializationD1_N131072(b *testing.B)  { benchmarkRun(b, arrLen[4]) }
func BenchmarkArrayInitializationD1_N1048576(b *testing.B) { benchmarkRun(b, arrLen[5]) }

func benchmarkRunWithData(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
		arr := make([]int, arrLen)
		for i := 0; i < arrLen; i++ {
			arr[i] = i
		}
	}
}

func BenchmarkArrayInitDataD1_N32(b *testing.B)      { benchmarkRunWithData(b, arrLen[0]) }
func BenchmarkArrayInitDataD1_N256(b *testing.B)     { benchmarkRunWithData(b, arrLen[1]) }
func BenchmarkArrayInitDataD1_N2048(b *testing.B)    { benchmarkRunWithData(b, arrLen[2]) }
func BenchmarkArrayInitDataD1_N16384(b *testing.B)   { benchmarkRunWithData(b, arrLen[3]) }
func BenchmarkArrayInitDataD1_N131072(b *testing.B)  { benchmarkRunWithData(b, arrLen[4]) }
func BenchmarkArrayInitDataD1_N1048576(b *testing.B) { benchmarkRunWithData(b, arrLen[5]) }