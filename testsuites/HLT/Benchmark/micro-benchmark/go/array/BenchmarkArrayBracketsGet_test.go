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

var element1 int
func benchmarkBracketsGetRunD1(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	for i := 0; i < arrLen; i++ {
		arr[i] = i
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		element1 = arr[arrLen/2]
	}
}

func BenchmarkArrayBracketsGetD1(b *testing.B)      { benchmarkBracketsGetRunD1(b, 32) }
func BenchmarkArrayBracketsGetD1_N32(b *testing.B)      { benchmarkBracketsGetRunD1(b, 32) }
func BenchmarkArrayBracketsGetD1_N256(b *testing.B)     { benchmarkBracketsGetRunD1(b, 256) }
func BenchmarkArrayBracketsGetD1_N2048(b *testing.B)    { benchmarkBracketsGetRunD1(b, 2048) }
func BenchmarkArrayBracketsGetD1_N1048576(b *testing.B) { benchmarkBracketsGetRunD1(b, 1048576) }

func benchmarkBracketsGetRunD2(b *testing.B, arrLen int) {
	arr := make([][]int, arrLen)
	for j := 0; j < arrLen; j++ {
		arr[j] = make([]int, arrLen)
	}
	for i := 0; i < arrLen; i++ {
		for j := 0; j < arrLen; j++ {
			arr[i][j] = i
		}
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		element1 = arr[arrLen/2][arrLen/2]
	}
}

func BenchmarkArrayBracketsGetD2(b *testing.B)      { benchmarkBracketsGetRunD2(b, 32) }
func BenchmarkArrayBracketsGetD2_N32(b *testing.B)      { benchmarkBracketsGetRunD2(b, 32) }
func BenchmarkArrayBracketsGetD2_N256(b *testing.B)      { benchmarkBracketsGetRunD2(b, 256) }
func BenchmarkArrayBracketsGetD2_N2048(b *testing.B)      { benchmarkBracketsGetRunD2(b, 2048) }

func benchmarkBracketsGetRunD3(b *testing.B, arrLen int) {
	arr := make([][][]int, arrLen)
	for j := 0; j < arrLen; j++ {
		arr[j] = make([][]int, arrLen)
		for k := 0; k < arrLen; k++ {
			arr[j][k] = make([]int, arrLen)
		}
	}
	for i := 0; i < arrLen; i++ {
		for j := 0; j < arrLen; j++ {
			for k := 0; k < arrLen; k++ {
				arr[i][j][k] = i
			}
		}
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		element1 = arr[arrLen/2][arrLen/2][arrLen/2]
	}
}

func BenchmarkArrayBracketsGetD3(b *testing.B)      { benchmarkBracketsGetRunD3(b, 32) }
func BenchmarkArrayBracketsGetD3_N32(b *testing.B)      { benchmarkBracketsGetRunD3(b, 32) }
func BenchmarkArrayBracketsGetD3_N128(b *testing.B)      { benchmarkBracketsGetRunD3(b, 128) }
