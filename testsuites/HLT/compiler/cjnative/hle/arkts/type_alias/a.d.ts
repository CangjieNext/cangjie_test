// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
type TB230<V = string, W extends 'abc' | 'def' = 'abc'> = (arg: V) => W;
type TB300 = Promise<number>;
type TB310 = Promise<boolean>[];
type TB700 = Record<string, string | number> | null;
type MyUnion8 = (string | number)[] | { key: string };
//简单元组类型
export type BasicTuple = [number, string, boolean];

//元组类型的可选类型
export type OptionalElementTuple = [number, string?, boolean?];

//异构元组类型
export type HeterogeneousTuple = [string, number, boolean, Date];

//元组的剩余元素
export type RestTuple = [string, ...number[]];

//包含固定长度的元组
export type FixedLengthTuple = [number, string, boolean];

//元组与数组的结合
export type TupleArray = [number, string][];

//多维元组
export type TwoDimensionalTuple = [[number, string], [boolean, Date]];

//元组与联合类型结合
export type UnionTuple = [string | number, boolean, Date];

type TA10 = number;
type TA20 = string;
type TA30 = boolean;
type TA40 = bigint;
type TA50 = object;
type TA60 = symbol;
type TA70 = void;
type TA80 = undefined;
type TA90 = any;
type TA100 = unknown;
type TA110 = never;

type TA200 = () => void;
type TA210<V> = (arg: V) => void;
type TA220<V, W extends string> = (arg: V) => W;
type TA230<V = object, W extends string = '123' | '345'> = (arg: V) => W; // type parameter default values are unsupported
type TA240 = (...a: number[]) => void;
type TA250 = (a?: number) => void;

type TA300 = Promise<string>;
type TA310 = Promise<string>[];

type TA400 = Pick<Promise<void>, 'then'>;
type TA410 = Omit<Promise<void>, ''>;
type TA420 = Omit<Promise<void>, ''>;

type TA500 = 123;
type TA510 = 'abc';
type TA520 = null;

type TA600 = [number, string, number];

type TA700 = Record<string, unknown> | null;
type TA710 = "aaa" | "bbb" | "ccc" | "ddd";
type TA720 = number | string;
type TA730 = Promise<string> | string;
type TA740 = "111" | TA710;

type TA810 = { x: number; y: string };
type TA820 = { [p: number]: string };
type TA830 = { (arg: number): string };

type TA900 = readonly number[];
type TA910 = keyof { x: number; y: string };

type TA1000 = typeof setTimeout;
type TA1010 = ReturnType<typeof setTimeout>;

type ARK1 = null | number | string | boolean | Uint8Array | Float32Array | bigint | Int8Array | Int16Array | Uint16Array | Uint32Array | Int32Array | BigInt64Array | BigUint64Array | Float64Array;

// 交叉类型别名
type User = {
    id: number;
    name: string;
} & { isActive: boolean };

// 泛型类型别名
type ApiResponse<T> = {
    data: T;
    status: number;
};

export type AnimationItem = {
    name: string;
    name1: string;
    play11(name?: string,name1?: string): void;
};