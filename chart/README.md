# sulfoxide-silicon

![Version: 1.17.2](https://img.shields.io/badge/Version-1.17.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Helm chart to deploy all different types OTEL Collectors for infrastructure telemetry for AtomiCloud

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.2.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apps | object | `{"container-logs":{"collector":"container-logs.yaml","enable":true,"spec":{"env":[{"name":"KUBE_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}}],"envFrom":[{"secretRef":{"name":"o2-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"daemonset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"container-logs-collector"},"podSecurityContext":{"runAsNonRoot":false},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"resources":{"limits":{"cpu":1,"memory":"1Gi"},"requests":{"cpu":"250m","memory":"256Mi"}},"securityContext":{},"serviceAccount":"otel-container-logs-sa","volumeMounts":[{"mountPath":"/var/log/pods","name":"varlogpods","readOnly":true},{"mountPath":"/var/lib/docker/containers","name":"varlibdockercontainers","readOnly":true}],"volumes":[{"hostPath":{"path":"/var/log/pods"},"name":"varlogpods"},{"hostPath":{"path":"/var/lib/docker/containers"},"name":"varlibdockercontainers"}]}},"k8s-cluster":{"collector":"k8s-cluster.yaml","enable":true,"spec":{"envFrom":[{"secretRef":{"name":"o2-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"deployment","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"cluster-metrics-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"replicas":1,"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"256Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-k8scluster-sa"}},"k8s-events":{"collector":"k8s-events.yaml","enable":true,"spec":{"envFrom":[{"secretRef":{"name":"o2-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"deployment","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"cluster-events-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"replicas":1,"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"256Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-k8sevents-sa"}},"kubelet-stats":{"collector":"kubelet-stats-node-name.yaml","enable":true,"spec":{"env":[{"name":"K8S_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}},{"name":"KUBE_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}},{"name":"NODE_IP","valueFrom":{"fieldRef":{"fieldPath":"status.hostIP"}}}],"envFrom":[{"secretRef":{"name":"o2-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"daemonset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"kubelet-stats-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"128Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-kubelet-sa"}},"otlp":{"collector":"otlp.yaml","enable":true,"spec":{"env":[{"name":"KUBE_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}}],"envFrom":[{"secretRef":{"name":"o2-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"daemonset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"otlp-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"128Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-otlp-sa"}},"target-allocator":{"collector":"ta.yaml","enable":true,"spec":{"envFrom":[{"secretRef":{"name":"o2-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"statefulset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"target-allocator-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"replicas":1,"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"256Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-ta-sa","targetAllocator":{"enabled":true,"prometheusCR":{"enabled":true},"serviceAccount":"otel-collector-ta-sa"}}}}` | Dictionary of collectors to deploy. Key is the name of the collector, while the value is the configuration for the collector. This has 2 sub keys: `collector` which is the actual [collector configuration](https://opentelemetry.io/docs/collector/configuration/), and `spec`, which is the [operator's configuration](https://github.com/open-telemetry/opentelemetry-operator/blob/main/docs/api.md#opentelemetrycollectorspec) for the collector. |
| auth | object | `{"external":{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"secretStore":{"kind":"SecretStore","name":"doppler-silicon"}},"internal":{"enable":false,"loki":{"token":"sometoken","user":"someuser"},"o2":"sometoken","tempo":{"token":"sometoken","user":"someuser"}},"remote":{"loki":{"token":"MANUAL_LOKI_TOKEN","user":"MANUAL_LOKI_USER"},"o2":"MANUAL_O2_TOKEN","tempo":{"token":"MANUAL_TEMPO_TOKEN","user":"MANUAL_TEMPO_USER"}},"secretName":"o2-cloud-secrets"}` | Auth configuration for the collectors |
| auth.external | object | `{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"secretStore":{"kind":"SecretStore","name":"doppler-silicon"}}` | Use external auth for the collectors |
| auth.external.enable | bool | `true` | Enable external auth |
| auth.external.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| auth.external.policy.creation | string | `"Owner"` | External Secret Creation Policy |
| auth.external.policy.deletion | string | `"Retain"` | External Secret Deletion Policy |
| auth.external.secretStore | object | `{"kind":"SecretStore","name":"doppler-silicon"}` | Secret Store to use for secrets |
| auth.external.secretStore.kind | string | `"SecretStore"` | Kind of the secret store, either `ClusterSecretStore` or `SecretStore` |
| auth.external.secretStore.name | string | `"doppler-silicon"` | Name of the secret store |
| auth.internal | object | `{"enable":false,"loki":{"token":"sometoken","user":"someuser"},"o2":"sometoken","tempo":{"token":"sometoken","user":"someuser"}}` | Use internal auth for the collectors (hard coded password) |
| auth.internal.enable | bool | `false` | Enable internal auth |
| auth.internal.loki | object | `{"token":"sometoken","user":"someuser"}` | Grafana Cloud Loki plaintext user |
| auth.internal.loki.token | string | `"sometoken"` | Grafana Cloud Loki plaintext token |
| auth.internal.loki.user | string | `"someuser"` | Grafana Cloud Loki plaintext user |
| auth.internal.o2 | string | `"sometoken"` | OpenObserve plaintext token |
| auth.internal.tempo | object | `{"token":"sometoken","user":"someuser"}` | Grafana Cloud Tempo plaintext user |
| auth.internal.tempo.token | string | `"sometoken"` | Grafana Cloud Tempo plaintext token |
| auth.internal.tempo.user | string | `"someuser"` | Grafana Cloud Tempo plaintext user |
| auth.remote | object | `{"loki":{"token":"MANUAL_LOKI_TOKEN","user":"MANUAL_LOKI_USER"},"o2":"MANUAL_O2_TOKEN","tempo":{"token":"MANUAL_TEMPO_TOKEN","user":"MANUAL_TEMPO_USER"}}` | Remote Tokens |
| auth.remote.loki.token | string | `"MANUAL_LOKI_TOKEN"` | Grafana Cloud Loki Token |
| auth.remote.loki.user | string | `"MANUAL_LOKI_USER"` | Grafana Cloud Loki User |
| auth.remote.o2 | string | `"MANUAL_O2_TOKEN"` | OpenObserve Token |
| auth.remote.tempo.token | string | `"MANUAL_TEMPO_TOKEN"` | Grafana Cloud Tempo Token |
| auth.remote.tempo.user | string | `"MANUAL_TEMPO_USER"` | Grafana Cloud Tempo User |
| auth.secretName | string | `"o2-cloud-secrets"` | Name of the secret to use for the collector |
| cluster | string | `"opal"` | Cluster the operators are deployed to |
| configMapName | string | `"otel-common-config-map"` | Name of the common config map to propagate to all collectors |
| containerLogs.serviceAccount | object | `{"create":true,"name":"otel-container-logs-sa"}` | Service account for Container Logs |
| containerLogs.serviceAccount.create | bool | `true` | Enable creation of the service account |
| containerLogs.serviceAccount.name | string | `"otel-container-logs-sa"` | Name of the service account |
| k8sattr | object | `{"bind":["otel-collector-kubelet-sa","otel-collector-otlp-sa","otel-container-logs-sa","otel-collector-k8scluster-sa","otel-collector-ta-sa"],"createRole":true}` | Configuration for k8sattr extension |
| k8sattr.bind | list | `["otel-collector-kubelet-sa","otel-collector-otlp-sa","otel-container-logs-sa","otel-collector-k8scluster-sa","otel-collector-ta-sa"]` | Service accounts to bind the k8sattr roles to |
| k8sattr.createRole | bool | `true` | Enable creation k8sattr role |
| k8scluster | object | `{"createRole":true,"serviceAccount":{"create":true,"name":"otel-collector-k8scluster-sa"}}` | Configuration for K8S Cluster Collector |
| k8scluster.createRole | bool | `true` | Enable creation of k8s cluster role |
| k8scluster.serviceAccount | object | `{"create":true,"name":"otel-collector-k8scluster-sa"}` | Service account for k8s cluster |
| k8scluster.serviceAccount.create | bool | `true` | Enable creation of the service account |
| k8scluster.serviceAccount.name | string | `"otel-collector-k8scluster-sa"` | Name of the service account |
| k8sevents | object | `{"createRole":true,"serviceAccount":{"create":true,"name":"otel-collector-k8sevents-sa"}}` | Configuration for K8S Event Collector |
| k8sevents.createRole | bool | `true` | Enable creation of k8s events role |
| k8sevents.serviceAccount | object | `{"create":true,"name":"otel-collector-k8sevents-sa"}` | Service account for k8s events |
| k8sevents.serviceAccount.create | bool | `true` | Enable creation of the service account |
| k8sevents.serviceAccount.name | string | `"otel-collector-k8sevents-sa"` | Name of the service account |
| kubelet | object | `{"createRole":true,"serviceAccount":{"create":true,"name":"otel-collector-kubelet-sa"},"vclusterCompatibility":false}` | Configuration for Kubelet Collector |
| kubelet.createRole | bool | `true` | Enable creation of kubelet role |
| kubelet.serviceAccount | object | `{"create":true,"name":"otel-collector-kubelet-sa"}` | Service account for kubelet |
| kubelet.serviceAccount.create | bool | `true` | Enable creation of the service account |
| kubelet.serviceAccount.name | string | `"otel-collector-kubelet-sa"` | Name of the service account |
| kubelet.vclusterCompatibility | bool | `false` | VCluster Compatibility |
| landscape | string | `"entei"` | Landscape the operator is deployed to |
| lokiEndpoint | string | `"https://logs-prod-020.grafana.net/loki/api/v1/push"` | Grafana Cloud Loki Endpoint |
| o2Endpoint | string | `"https://api.openobserve.ai/api/atomicloud_MwvsSHPiOT9uFdn/"` | Open Observe Endpoint |
| otlp.serviceAccount | object | `{"create":true,"name":"otel-collector-otlp-sa"}` | Service account for OTLP |
| otlp.serviceAccount.create | bool | `true` | Enable creation of the service account |
| otlp.serviceAccount.name | string | `"otel-collector-otlp-sa"` | Name of the service account |
| podSecurityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | YAML Anchor for PodSecurityContext |
| secretAnnotation | object | `{"argocd.argoproj.io/sync-wave":"-2"}` | Secret Annotations (External Secrets) to control synchronization |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | YAML Anchor for SecurityContext |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"silicon"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sulfoxide-bromine | object | `{"annotations":{"argocd.argoproj.io/sync-wave":"-3"},"rootSecret":{"ref":"SULFOXIDE_SILICON"},"storeName":"doppler-silicon"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"ref":"SULFOXIDE_SILICON"}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | string | `"SULFOXIDE_SILICON"` | DOPPLER Token Reference |
| sulfoxide-bromine.storeName | string | `"doppler-silicon"` | Store name to create |
| ta | object | `{"createRole":true,"serviceAccount":{"create":true,"name":"otel-collector-ta-sa"}}` | Configuration for Target Allocator |
| ta.createRole | bool | `true` | Enable creation of target allocator roles |
| ta.serviceAccount | object | `{"create":true,"name":"otel-collector-ta-sa"}` | Service account for target allocation |
| ta.serviceAccount.create | bool | `true` | Enable creation of the service account |
| ta.serviceAccount.name | string | `"otel-collector-ta-sa"` | Name of the service account |
| tags | object | `{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"}` | Kubernetes labels and annotations, following Service Tree |
| tempoEndpoint | string | `"https://otlp-gateway-prod-ap-southeast-1.grafana.net/otlp"` | Grafana Cloud Tempo Endpoint |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.1](https://github.com/norwoodj/helm-docs/releases/v1.11.1)