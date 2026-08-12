/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: inputs.cj utils.cj visitors.cj
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f inputs.cj utils.cj visitors.cj -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color

import std.ast.*
import std.collection.*

@Test
@Measure[TimeNow(Nanos)]
public class TestSerializableFieldMessage {
    let patchMetaInput1: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let patchMetaInput2: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let patchMetaInput3: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let patchMetaInput4: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let serializableInput1: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let serializableInput2: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let serializableInput3: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let serializableInput4: ArrayList<(String, String)> = ArrayList<(String, String)>()
    let genericSingleResourceInput1:  ArrayList<(String, String)> = ArrayList<(String, String)>()
    let genericSingleResourceInput2:  ArrayList<(String, String)> = ArrayList<(String, String)>()

    TestSerializableFieldMessage() {
        patchMetaInput1.add(all: [
            ("isOmitempty = true", "public var name: String = \"\""), 
            ("isOmitempty = true", "public var group: String = \"\""),
            ("isOmitempty = true", "public var kind: String = \"\""),
            ("isOmitempty = true", "public var uid: String = \"\""),
            ("isOmitempty = true", "public var causes: ArrayList < StatusCause >= ArrayList < StatusCause >()"),
            ("isOmitempty = true, aliasName = \"retryAfterSeconds\"", "var retryAfterSeconds_: Int32 = 0")
        ])
        serializableInput1.add(all: [
            ("isOmitempty = true", "public var name: String = \"\""),
            ("isOmitempty = true", "public var generateName: String = \"\""),
            ("isOmitempty = true", "public var namespace: String = \"\""),
            ("isOmitempty = true", "public var selfLink: String = \"\""),
            ("isOmitempty = true", "public var uid: String = \"\""),
            ("isOmitempty = true", "public var resourceVersion: String = \"\""),
            ("isOmitempty = true", "public var generation: Int64 = 0"),
            ("isOmitempty = true", "public var creationTimestamp: TimeWrapper = TimeWrapper.zero()"),
            ("isOmitempty = true", "public var deletionTimestamp: Option < TimeWrapper >= None"),
            ("isOmitempty = true", "public var deletionGracePeriodSeconds: Option < Int64 >= None"),
            ("isOmitempty = true", "public var labels: HashMap < String, String >= HashMap < String, String >()"),
            ("isOmitempty = true", "public var annotations: HashMap < String, String >= HashMap < String, String >()"),
            ("isOmitempty = true", "public var ownerReferences: ArrayList < OwnerReference >= ArrayList < OwnerReference >()"),
            ("isOmitempty = true", "public var finalizers: ArrayList < String >= ArrayList < String >()"),
            ("isOmitempty = true", "public var managedFields: ArrayList < ManagedFieldsEntry >= ArrayList < ManagedFieldsEntry >()"),
            ("isOmitempty = true", "public var clusterName: String = \"\"")
        ])

        serializableInput2.add(all: [
            ("isOmitempty = true", "public var version: String = String.empty"),
            ("isOmitempty = true", "public var validation: Option < CustomResourceValidation >= None"),
            ("isOmitempty = true", "public var subresources: Option < CustomResourceSubresources >= None"),
            ("isOmitempty = true", "public var versions: ArrayList < CustomResourceDefinitionVersion >= ArrayList < CustomResourceDefinitionVersion >()"),
            ("isOmitempty = true", """
public var additionalPrinterColumns: ArrayList < CustomResourceColumnDefinition >= 
    ArrayList < CustomResourceColumnDefinition >()"""),
            ("isOmitempty = true", """
public var conversion: Option < CustomResourceConversion >= CustomResourceConversion(
    ConversionStrategyType.NONE_CONVERTER)"""),
            ("isOmitempty = true", "public var preserveUnknownFields: Bool = false")
        ])

        patchMetaInput2.add(all: [
            ("isOmitempty = true", "public var id: String = String.empty"),
            ("isOmitempty = true", "public var schema: String = String.empty"),
            ("isOmitempty = true", "public var ref: Option < String >= None"),
            ("isOmitempty = true", "public var description: String = String.empty"),
            ("isOmitempty = true, aliasName = \"type\"", "public var `type`: String = String.empty"),
            ("isOmitempty = true", "public var format: String = String.empty"),
            ("isOmitempty = true", "public var title: String = String.empty"),
            ("isOmitempty = true", "public var default: Option < JSON >= None"),
            ("isOmitempty = true", "public var maximum: Option < Float64 >= None"),
            ("isOmitempty = true", "public var exclusiveMaximum: Bool = false"),
            ("isOmitempty = true", "public var minimum: Option < Float64 >= None"),
            ("isOmitempty = true", "public var exclusiveMinimum: Bool = false"),
            ("isOmitempty = true", "public var maxLength: Option < Int64 >= None"),
            ("isOmitempty = true", "public var minLength: Option < Int64 >= None"),
            ("isOmitempty = true", "public var pattern: String = String.empty"),
            ("isOmitempty = true", "public var maxItems: Option < Int64 >= None"),
            ("isOmitempty = true", "public var minItems: Option < Int64 >= None"),
            ("isOmitempty = true", "public var uniqueItems: Bool = false"),
            ("isOmitempty = true", "public var multipleOf: Option < Float64 >= None"),
            ("isOmitempty = true, aliasName = \"enum\"", "public var `enum`: ArrayList < JSON >= ArrayList < JSON >()"),
            ("isOmitempty = true", "public var maxProperties: Option < Int64 >= None"),
            ("isOmitempty = true", "public var minProperties: Option < Int64 >= None"),
            ("isOmitempty = true", "public var required: ArrayList < String >= ArrayList < String >()"),
            ("isOmitempty = true", "public var items: Option < JSONSchemaPropsOrArray >= None"),
            ("isOmitempty = true", "public var allOf: ArrayList < JSONSchemaProps >= ArrayList < JSONSchemaProps >()"),
            ("isOmitempty = true", "public var oneOf: ArrayList < JSONSchemaProps >= ArrayList < JSONSchemaProps >()"),
            ("isOmitempty = true", "public var anyOf: ArrayList < JSONSchemaProps >= ArrayList < JSONSchemaProps >()"),
            ("isOmitempty = true", "public var not: Option < JSONSchemaProps >= None"),
            ("isOmitempty = true", "public var properties: HashMap < String, JSONSchemaProps >= HashMap < String, JSONSchemaProps >()"),
            ("isOmitempty = true", "public var additionalProperties: Option < JSONSchemaPropsOrBool >= None"),
            ("isOmitempty = true", "public var patternProperties: HashMap < String, JSONSchemaProps >= HashMap < String, JSONSchemaProps >()"),
            ("isOmitempty = true", """
public var dependencies: HashMap < String, JSONSchemaPropsOrStringArray >= HashMap < String, JSONSchemaPropsOrStringArray >(
    )"""),
            ("isOmitempty = true", "public var additionalItems: Option < JSONSchemaPropsOrBool >= None"),
            ("isOmitempty = true", "public var definitions: HashMap < String, JSONSchemaProps >= HashMap < String, JSONSchemaProps >()"),
            ("isOmitempty = true", "public var externalDocs: Option < ExternalDocumentation >= None"),
            ("isOmitempty = true", "public var example: Option < JSON >= None"),
            ("isOmitempty = true", "public var nullable: Bool = false"),
            ("isOmitempty = true, aliasName = \"x-kubernetes-preserve-unknown-fields\"", "public var xPreserveUnknownFields: Option < Bool >= None"),
            ("isOmitempty = true, aliasName = \"x-kubernetes-embedded-resource\"", "public var xEmbeddedResource: Bool = false"),
            ("isOmitempty = true, aliasName = \"x-kubernetes-int-or-string\"", "public var xIntOrString: Bool = false"),
            ("isOmitempty = true, aliasName = \"x-kubernetes-list-map-keys\"", "public var xListMapKeys: ArrayList < String >= ArrayList < String >()"),
            ("isOmitempty = true, aliasName = \"x-kubernetes-list-type\"", "public var xListType: Option < String >= None"),
            ("isOmitempty = true, aliasName = \"x-kubernetes-map-typ\"", "public var xMapType: Option < String >= None"),
            ("isOmitempty = true, aliasName = \"x-kubernetes-validations\"", "public var xValidations: ArrayList < ValidationRule >= ArrayList < ValidationRule >()")
        ])

        genericSingleResourceInput1.add(all: [
            ("isInline = true", "public var typeMeta: TypeMeta = TypeMeta()"),
            ("isOmitempty = true", "public var metadata: ObjectMeta = ObjectMeta()"),
            ("isOmitempty = true", "public var subjects: ArrayList < Subject >= ArrayList < Subject >()")
        ])

        patchMetaInput3.add(all: [
            ("aliasName = \"request\"", "var jsonRequest: ByteArrayWrapper = ByteArrayWrapper()"),
            ("isSerializable = false", "var protobufRequest: Array < Byte >= this.jsonRequest.data"),
            ("isOmitempty = true, aliasName = \"expirationSeconds\"", "var expirationSeconds_: Option < Int32 >= None"),
            ("isOmitempty = true", "public var extra: HashMap < String, ModelExtraValue >= HashMap()"),
            ("isOmitempty = true", "public var groups: ArrayList < String >= ArrayList < String >([\"system:masters\", \"system:authenticated\"])"),
            ("isOmitempty = true", "public var uid: String = String.empty"),
            ("isOmitempty = true", "public var usages: ArrayList < String >= ArrayList()"),
            ("isOmitempty = true", "public var username: String = \"kube-apiserver-kubelet-client\"")
        ])

        serializableInput3.add(all: [
            ("isOmitempty = true", "public var image: String = String.empty"),
            ("isOmitempty = true", "public var command: ArrayList < String >= ArrayList < String >()"),
            ("isOmitempty = true", "public var args: ArrayList < String >= ArrayList < String >()"),
            ("isOmitempty = true", "public var workingDir: String = String.empty"),
            ("isOmitempty = true", "public var ports: ArrayList < ContainerPort >= ArrayList < ContainerPort >()"),
            ("isOmitempty = true", "public var envFrom: ArrayList < EnvFromSource >= ArrayList < EnvFromSource >()"),
            ("isOmitempty = true", "public var env: ArrayList < EnvVar >= ArrayList < EnvVar >()"),
            ("isOmitempty = true", "public var resources: ResourceRequirements = ResourceRequirements()"),
            ("isOmitempty = true", "public var volumeMounts: ArrayList < VolumeMount >= ArrayList < VolumeMount >()"),
            ("isOmitempty = true", "public var volumeDevices: ArrayList < VolumeDevice >= ArrayList < VolumeDevice >()"),
            ("isOmitempty = true", "public var livenessProbe:?Probe = None"),
            ("isOmitempty = true", "public var readinessProbe:?Probe = None"),
            ("isOmitempty = true", "public var startupProbe:?Probe = None"),
            ("isOmitempty = true", "public var lifecycle:?Lifecycle = None"),
            ("isOmitempty = true", "public var terminationMessagePath: String = \"/dev/termination-log\""),
            ("isOmitempty = true", "public var terminationMessagePolicy: String = \"File\""),
            ("isOmitempty = true", "public var imagePullPolicy: String = String.empty"),
            ("isOmitempty = true", "public var securityContext:?SecurityContext = None"),
            ("isOmitempty = true", "public var stdin: Bool = false"),
            ("isOmitempty = true", "public var stdinOnce: Bool = false"),
            ("isOmitempty = true", "public var tty: Bool = false")
        ])

        genericSingleResourceInput2.add(all: [
            ("isInline = true", "public var typeMeta: TypeMeta = TypeMeta()"),
            ("isOmitempty = true", "public var reason: String = String.empty"),
            ("isOmitempty = true", "public var message: String = String.empty"),
            ("isOmitempty = true", "public var source: EventSource = EventSource()"),
            ("isOmitempty = true", "public var firstTimestamp: TimeWrapper = TimeWrapper.zero()"),
            ("isOmitempty = true", "public var lastTimestamp: TimeWrapper = TimeWrapper.zero()"),
            ("isOmitempty = true", "public var count: Int32 = 0"),
            ("aliasName = \"type\", isOmitempty = true", "public var type_: String = String.empty"),
            ("isOmitempty = true", "public var eventTime: MicroTime = MicroTime.zero()"),
            ("isOmitempty = true", "public var series:?EventSeries = None"),
            ("isOmitempty = true", "public var action: String = String.empty"),
            ("isOmitempty = true", "public var related:?ObjectReference = None"),
            ("aliasName = \"reportingComponent\"", "public var reportingController: String = String.empty")
        ])

        serializableInput4.add(all: [
            ("isOmitempty = true", "public var volumes: ArrayList < Volume >= ArrayList < Volume >()"),
            ("isOmitempty = true", "public var initContainers: ArrayList < Container >= ArrayList < Container >()"),
            ("isOmitempty = true", "public var containers: ArrayList < Container >= ArrayList < Container >()"),
            ("isOmitempty = true", "public var ephemeralContainers: ArrayList < EphemeralContainer >= ArrayList < EphemeralContainer >()"),
            ("isOmitempty = true", "public var restartPolicy: String = String.empty"),
            ("isOmitempty = true", "public var terminationGracePeriodSeconds:?Int64 = None"),
            ("isOmitempty = true", "public var activeDeadlineSeconds:?Int64 = None"),
            ("isOmitempty = true", "public var dnsPolicy: String = String.empty"),
            ("isOmitempty = true", "public var nodeSelector: HashMap < String, String >= HashMap < String, String >()"),
            ("isOmitempty = true", "public var serviceAccountName: String = String.empty"),
            ("aliasName = \"serviceAccount\", isOmitempty = true", "public var deprecatedServiceAccount: String = String.empty"),
            ("isOmitempty = true", "public var automountServiceAccountToken:?Bool = None"),
            ("isOmitempty = true", "public var nodeName: String = String.empty"),
            ("isOmitempty = true", "public var hostNetwork: Bool = false"),
            ("isOmitempty = true", "public var hostPID: Bool = false"),
            ("isOmitempty = true", "public var hostIPC: Bool = false"),
            ("isOmitempty = true", "public var shareProcessNamespace:?Bool = None"),
            ("isOmitempty = true", "public var securityContext:?PodSecurityContext = None"),
            ("isOmitempty = true", "public var imagePullSecrets: ArrayList < LocalObjectReference >= ArrayList < LocalObjectReference >()"),
            ("isOmitempty = true", "public var hostname: String = String.empty"),
            ("isOmitempty = true", "public var subdomain: String = String.empty"),
            ("isOmitempty = true", "public var affinity:?Affinity = None"),
            ("isOmitempty = true", "public var schedulerName: String = \"default-scheduler\""),
            ("isOmitempty = true", "public var tolerations: ArrayList < Toleration >= ArrayList < Toleration >()"),
            ("isOmitempty = true", "public var hostAliases: ArrayList < HostAlias >= ArrayList < HostAlias >()"),
            ("isOmitempty = true", "public var priorityClassName: String = String.empty"),
            ("isOmitempty = true", "public var priority:?Int32 = None"),
            ("isOmitempty = true", "public var dnsConfig:?PodDNSConfig = None"),
            ("isOmitempty = true", "public var readinessGates: ArrayList < PodReadinessGate >= ArrayList < PodReadinessGate >()"),
            ("isOmitempty = true", "public var runtimeClassName:?String = None"),
            ("isOmitempty = true", "public var enableServiceLinks:?Bool = None"),
            ("isOmitempty = true", "public var preemptionPolicy:?String = None"),
            ("isOmitempty = true", "public var overhead: HashMap < String, Quantity >= HashMap < String, Quantity >()"),
            ("isOmitempty = true", "public var topologySpreadConstraints: ArrayList < TopologySpreadConstraint >= ArrayList < TopologySpreadConstraint >()"),
            ("isOmitempty = true", "public var setHostnameAsFQDN:?Bool = None"),
            ("isOmitempty = true", "public var os:?PodOS = None"),
            ("isOmitempty = true", "public var hostUsers:?Bool = None")
        ])

        patchMetaInput4.add(all: [
            ("isOmitempty = true", "public var image: String = String.empty"),
            ("isOmitempty = true", "public var command: ArrayList < String >= ArrayList < String >()"),
            ("isOmitempty = true", "public var args: ArrayList < String >= ArrayList < String >()"),
            ("isOmitempty = true", "public var workingDir: String = String.empty"),
            ("isOmitempty = true", "public var ports: ArrayList < ContainerPort >= ArrayList < ContainerPort >()"),
            ("isOmitempty = true", "public var envFrom: ArrayList < EnvFromSource >= ArrayList < EnvFromSource >()"),
            ("isOmitempty = true", "public var env: ArrayList < EnvVar >= ArrayList < EnvVar >()"),
            ("isOmitempty = true", "public var resources: ResourceRequirements = ResourceRequirements()"),
            ("isOmitempty = true", "public var volumeMounts: ArrayList < VolumeMount >= ArrayList < VolumeMount >()"),
            ("isOmitempty = true", "public var volumeDevices: ArrayList < VolumeDevice >= ArrayList < VolumeDevice >()"),
            ("isOmitempty = true", "public var livenessProbe:?Probe = None"),
            ("isOmitempty = true", "public var readinessProbe:?Probe = None"),
            ("isOmitempty = true", "public var startupProbe:?Probe = None"),
            ("isOmitempty = true", "public var lifecycle:?Lifecycle = None"),
            ("isOmitempty = true", "public var terminationMessagePath: String = \"/dev/termination-log\""),
            ("isOmitempty = true", "public var terminationMessagePolicy: String = \"File\""),
            ("isOmitempty = true", "public var imagePullPolicy: String = String.empty"),
            ("isOmitempty = true", "public var securityContext:?SecurityContext = None"),
            ("isOmitempty = true", "public var stdin: Bool = false"),
            ("isOmitempty = true", "public var stdinOnce: Bool = false"),
            ("isOmitempty = true", "public var tty: Bool = false")
        ])
    }

    public func handleMessages (val1: String, val2: String) {
        // val1: attr, val2: input
        let childAttr = cangjieLex(val1)
        let childInput = cangjieLex(val2)
        let varDecl = (parseDecl(childInput) as VarDecl).getOrThrow()

        // in parseFiledAnnotation()
        var tokensStr = childAttr.toString()
        
        // in Field()
        let fieldName = varDecl.identifier.value
        let isStatic = judgeModifiersHasStatic(varDecl.modifiers.toTokens())
        let typeTokens = varDecl.declType.toTokens()
        ()
    }

    @Bench
    func BenchmarkSerializableFieldMessage_001() {
        for ((val1, val2) in this.serializableInput1) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_002() {
        for ((val1, val2) in this.serializableInput2) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_003() {
        for ((val1, val2) in this.serializableInput3) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_004() {
        for ((val1, val2) in this.serializableInput4) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_005() {
        for ((val1, val2) in this.patchMetaInput1) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_006() {
        for ((val1, val2) in this.patchMetaInput2) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_007() {
        for ((val1, val2) in this.patchMetaInput3) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_008() {
        for ((val1, val2) in this.patchMetaInput4) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_009() {
        for ((val1, val2) in this.genericSingleResourceInput1) {
            this.handleMessages(val1, val2)
        }
    }
    @Bench
    func BenchmarkSerializableFieldMessage_010() {
        for ((val1, val2) in this.genericSingleResourceInput2) {
            this.handleMessages(val1, val2)
        }
    }
}