/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.labels

public interface PermissionValue {
    operator func &(rhs: PermissionValue): PermissionValue
    operator func |(rhs: PermissionValue): PermissionValue
}

public class PermissionAnd <: PermissionValue {
    public let lhs: PermissionValue
    public let rhs: PermissionValue
    public const init(lhs: PermissionValue, rhs: PermissionValue) {
        this.lhs = lhs
        this.rhs = rhs
    }
    public operator const override func &(rhs: PermissionValue): PermissionValue {
        return PermissionAnd(this, rhs)
    }
    public operator const override func |(rhs: PermissionValue): PermissionValue {
        return PermissionOr(this, rhs)
    }
}

public class PermissionOr <: PermissionValue {
    public let lhs: PermissionValue
    public let rhs: PermissionValue
    public const init(lhs: PermissionValue, rhs: PermissionValue) {
        this.lhs = lhs
        this.rhs = rhs
    }
    public operator const override func &(rhs: PermissionValue): PermissionValue {
        return PermissionAnd(this, rhs)
    }
    public operator const override func |(rhs: PermissionValue): PermissionValue {
        return PermissionOr(this, rhs)
    }
}

extend String <: PermissionValue {
    public operator const func &(rhs: PermissionValue): PermissionValue {
        return PermissionAnd(this, rhs)
    }
    public operator const func |(rhs: PermissionValue): PermissionValue {
        return PermissionOr(this, rhs)
    }
}

@Annotation
public class APILevel {
    public let since: String
    public let atomicservice: Bool
    public let crossplatform: Bool
    public let deprecated: ?String
    public let form: Bool
    public let permission: ?PermissionValue
    public let syscap: String
    public let throwexception: Bool
    public let workerthread: Bool
    public let systemapi: Bool
    public const init(since!: String, atomicservice!: Bool = false, crossplatform!: Bool = false,
        deprecated!: ?String = None, form!: Bool = false, permission!: ?PermissionValue = None,
        syscap!: String = "", throwexception!: Bool = false, workerthread!: Bool = false, systemapi!: Bool = false) {
        this.since = since
        this.atomicservice = atomicservice
        this.crossplatform = crossplatform
        this.deprecated = deprecated
        this.form = form
        this.permission = permission
        this.syscap = syscap
        this.throwexception = throwexception
        this.workerthread = workerthread
        this.systemapi = systemapi
    }
}
