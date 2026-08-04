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

func benchmarkBracketsRangeSetRunD1(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for i := 0; i < arrLen; i++ {
		arr[i] = i
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		// go 用循环比仓颉快
		for j := 0; j < arrLen; j++ {
			arr[j] = 0
		}
	}
}

func BenchmarkArrayBracketsRangeSetD1_N32(b *testing.B)      { benchmarkBracketsRangeSetRunD1(b, 32) }
func BenchmarkArrayBracketsRangeSetD1_N256(b *testing.B)     { benchmarkBracketsRangeSetRunD1(b, 256) }
func BenchmarkArrayBracketsRangeSetD1_N2048(b *testing.B)    { benchmarkBracketsRangeSetRunD1(b, 2048) }
func BenchmarkArrayBracketsRangeSetD1_N65536(b *testing.B)   { benchmarkBracketsRangeSetRunD1(b, 65536) }
func BenchmarkArrayBracketsRangeSetD1_N1048576(b *testing.B) { benchmarkBracketsRangeSetRunD1(b, 1048576) }

func BenchmarkArrayBracketsRangeSetArrayD1_N32(b *testing.B)      { benchmarkBracketsRangeSetRunD1(b, 32) }
func BenchmarkArrayBracketsRangeSetArrayD1_N256(b *testing.B)     { benchmarkBracketsRangeSetRunD1(b, 256) }
func BenchmarkArrayBracketsRangeSetArrayD1_N2048(b *testing.B)    { benchmarkBracketsRangeSetRunD1(b, 2048) }
func BenchmarkArrayBracketsRangeSetArrayD1_N65536(b *testing.B)   { benchmarkBracketsRangeSetRunD1(b, 65536) }
func BenchmarkArrayBracketsRangeSetArrayD1_N1048576(b *testing.B) { benchmarkBracketsRangeSetRunD1(b, 1048576) }