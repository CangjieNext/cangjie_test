// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func defaultInformer(client: ClientSetInterface, resyncPeriod: Duration): SharedIndexInformer {
    return createFilteredApiServiceInformer(client, resyncPeriod,HashMap([(NAMESPACE_INDEX, metaNamespaceIndexFunc)]), tweakListOptions)
}

func defaultInformer01(client: ClientSetInterface, resyncPeriod: Duration): SharedIndexInformer {
    return createFilteredApiServiceInformer(client, resyncPeriod, HashMap([(NAMESPACE_INDEX, metaNamespaceIndexFunc)]),
        tweakListOptions)
}