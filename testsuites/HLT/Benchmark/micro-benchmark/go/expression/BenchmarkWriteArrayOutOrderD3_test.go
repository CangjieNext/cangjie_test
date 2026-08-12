/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression_test

import (
	"testing"
)

func benchmarkWriteOutOrderD3Run(b *testing.B, arrLen int) {
	arr := make([][][]int, arrLen)
	for i := 0; i < arrLen; i++ {
		arr[i] = make([][]int, arrLen)
		for j := 0; j < arrLen; j++ {
			arr[i][j] = make([]int, arrLen)
		}
	}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < arrLen; j+=step {
			for k := 0; k < arrLen; k+=step {
				for x := 0; x < arrLen; x+=step {
					arr[j][k][x] = j + k - x
				}
			}
		}
	}
}

func BenchmarkWriteArrayOutOfOrderD3_N32(b *testing.B)   { benchmarkWriteOutOrderD3Run(b, arrLen[0]) }
func BenchmarkWriteArrayOutOfOrderD3_N256(b *testing.B)  { benchmarkWriteOutOrderD3Run(b, arrLen[1]) }
