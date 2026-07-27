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

func benchmarkD3Run(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
		arr := make([][][]int, arrLen)
		for j := 0; j < arrLen; j++ {
			arr[j] = make([][]int, arrLen)
			for k := 0; k < arrLen; k++ {
				arr[j][k] = make([]int, arrLen)
			}
		}
	}
}

func BenchmarkArrayInitializationD3_N32(b *testing.B)   { benchmarkD3Run(b, arrLen[0]) }
func BenchmarkArrayInitializationD3_N256(b *testing.B)  { benchmarkD3Run(b, arrLen[1]) }

func benchmarkD3RunWithData(b *testing.B, arrLen int) {
	for i := 0; i < b.N; i++ {
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
	}
}

func BenchmarkArrayInitDataD3_N32(b *testing.B)   { benchmarkD3RunWithData(b, arrLen[0]) }
func BenchmarkArrayInitDataD3_N256(b *testing.B)  { benchmarkD3RunWithData(b, arrLen[1]) }