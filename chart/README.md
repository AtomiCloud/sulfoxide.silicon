# sulfoxide-silicon

![Version: 1.2.2](https://img.shields.io/badge/Version-1.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Helm chart to deploy all different types OTEL Collectors for infrastructure telemetry for AtomiCloud

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/atomicloud/sulfoxide.bromine | sulfoxide-bromine | 1.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apps | object | `{"container-logs":{"collector":"container-logs.yaml","spec":{"env":[{"name":"KUBE_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}}],"envFrom":[{"secretRef":{"name":"grafana-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"daemonset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"container-logs-collector"},"podSecurityContext":{"runAsNonRoot":false},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"resources":{"limits":{"cpu":1,"memory":"1Gi"},"requests":{"cpu":"250m","memory":"256Mi"}},"securityContext":{},"volumeMounts":[{"mountPath":"/var/log/pods","name":"varlogpods","readOnly":true},{"mountPath":"/var/lib/docker/containers","name":"varlibdockercontainers","readOnly":true}],"volumes":[{"hostPath":{"path":"/var/log/pods"},"name":"varlogpods"},{"hostPath":{"path":"/var/lib/docker/containers"},"name":"varlibdockercontainers"}]}},"k8s-cluster":{"collector":"k8s-cluster.yaml","spec":{"envFrom":[{"secretRef":{"name":"grafana-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"deployment","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"cluster-metrics-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"replicas":1,"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"256Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-k8scluster-sa"}},"k8s-events":{"collector":"k8s-events.yaml","spec":{"envFrom":[{"secretRef":{"name":"grafana-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"deployment","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"cluster-events-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"replicas":1,"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"256Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-k8sevents-sa"}},"kubelet-stats":{"collector":"kubelet-stats.yaml","spec":{"env":[{"name":"K8S_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}},{"name":"KUBE_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}}],"envFrom":[{"secretRef":{"name":"grafana-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"daemonset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"kubelet-stats-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"128Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"serviceAccount":"otel-collector-kubelet-sa"}},"otlp":{"collector":"otlp.yaml","spec":{"env":[{"name":"KUBE_NODE_NAME","valueFrom":{"fieldRef":{"fieldPath":"spec.nodeName"}}}],"envFrom":[{"secretRef":{"name":"grafana-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"daemonset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"otlp-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"ports":[{"name":"zpages","port":55679,"targetPort":55679}],"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"50m","memory":"128Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}}}},"target-allocator":{"collector":"ta.yaml","spec":{"envFrom":[{"secretRef":{"name":"grafana-cloud-secrets"}},{"configMapRef":{"name":"otel-common-config-map"}}],"mode":"statefulset","podAnnotations":{"<<":{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"},"atomi.cloud/module":"target-allocator-collector"},"podSecurityContext":{"<<":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"replicas":1,"resources":{"limits":{"cpu":"250m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"256Mi"}},"securityContext":{"<<":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}},"targetAllocator":{"enabled":true,"prometheusCR":{"enabled":true},"serviceAccount":"otel-collector-ta-sa"}}}}` | Dictionary of collectors to deploy. Key is the name of the collector, while the value is the configuration for the collector. This has 2 sub keys: `collector` which is the actual [collector configuration](https://opentelemetry.io/docs/collector/configuration/), and `spec`, which is the [operator's configuration](https://github.com/open-telemetry/opentelemetry-operator/blob/main/docs/api.md#opentelemetrycollectorspec) for the collector. |
| auth | object | `{"external":{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"secretStore":{"kind":"SecretStore","name":"doppler"}},"internal":{"enable":false,"loki":{"password":"","user":""},"mimir":{"password":"","user":""},"tempo":{"password":"","user":""}},"loki":{"password":{"local":"LOKI_PASSWORD","remote":"MANUAL_LOKI_PASSWORD"},"user":{"local":"LOKI_USER","remote":"MANUAL_LOKI_USER"}},"mimir":{"password":{"local":"MIMIR_PASSWORD","remote":"MANUAL_MIMIR_PASSWORD"},"user":{"local":"MIMIR_USER","remote":"MANUAL_MIMIR_USER"}},"secretName":"grafana-cloud-secrets","tempo":{"password":{"local":"TEMPO_PASSWORD","remote":"MANUAL_TEMPO_PASSWORD"},"user":{"local":"TEMPO_USER","remote":"MANUAL_TEMPO_USER"}}}` | Auth configuration for the collectors |
| auth.external | object | `{"enable":true,"policy":{"creation":"Owner","deletion":"Retain"},"secretStore":{"kind":"SecretStore","name":"doppler"}}` | Use external auth for the collectors |
| auth.external.enable | bool | `true` | Enable external auth |
| auth.external.policy | object | `{"creation":"Owner","deletion":"Retain"}` | External Secret Policy |
| auth.external.policy.creation | string | `"Owner"` | External Secret Creation Policy |
| auth.external.policy.deletion | string | `"Retain"` | External Secret Deletion Policy |
| auth.external.secretStore | object | `{"kind":"SecretStore","name":"doppler"}` | Secret Store to use for secrets |
| auth.external.secretStore.kind | string | `"SecretStore"` | Kind of the secret store, either `ClusterSecretStore` or `SecretStore` |
| auth.external.secretStore.name | string | `"doppler"` | Name of the secret store |
| auth.internal | object | `{"enable":false,"loki":{"password":"","user":""},"mimir":{"password":"","user":""},"tempo":{"password":"","user":""}}` | Use internal auth for the collectors (hard coded password) |
| auth.internal.enable | bool | `false` | Enable internal auth |
| auth.internal.loki.password | string | `""` | Password for Loki |
| auth.internal.loki.user | string | `""` | Username for Loki |
| auth.internal.mimir.password | string | `""` | Password for Mimir |
| auth.internal.mimir.user | string | `""` | Username for Mimir |
| auth.internal.tempo.password | string | `""` | Password for Tempo |
| auth.internal.tempo.user | string | `""` | Username for Tempo |
| auth.loki | object | `{"password":{"local":"LOKI_PASSWORD","remote":"MANUAL_LOKI_PASSWORD"},"user":{"local":"LOKI_USER","remote":"MANUAL_LOKI_USER"}}` | Loki auth configuration |
| auth.loki.password | object | `{"local":"LOKI_PASSWORD","remote":"MANUAL_LOKI_PASSWORD"}` | Password for Loki |
| auth.loki.password.local | string | `"LOKI_PASSWORD"` | Local Key reference |
| auth.loki.password.remote | string | `"MANUAL_LOKI_PASSWORD"` | Remote Key reference |
| auth.loki.user | object | `{"local":"LOKI_USER","remote":"MANUAL_LOKI_USER"}` | Username for Loki |
| auth.loki.user.local | string | `"LOKI_USER"` | Local Key reference |
| auth.loki.user.remote | string | `"MANUAL_LOKI_USER"` | Remote Key reference |
| auth.mimir | object | `{"password":{"local":"MIMIR_PASSWORD","remote":"MANUAL_MIMIR_PASSWORD"},"user":{"local":"MIMIR_USER","remote":"MANUAL_MIMIR_USER"}}` | Mimir auth configuration |
| auth.mimir.password | object | `{"local":"MIMIR_PASSWORD","remote":"MANUAL_MIMIR_PASSWORD"}` | Password for Mimir |
| auth.mimir.password.local | string | `"MIMIR_PASSWORD"` | Local Key reference |
| auth.mimir.password.remote | string | `"MANUAL_MIMIR_PASSWORD"` | Remote Key reference |
| auth.mimir.user | object | `{"local":"MIMIR_USER","remote":"MANUAL_MIMIR_USER"}` | Username for Mimir |
| auth.mimir.user.local | string | `"MIMIR_USER"` | Local Key reference |
| auth.mimir.user.remote | string | `"MANUAL_MIMIR_USER"` | Remote Key reference |
| auth.secretName | string | `"grafana-cloud-secrets"` | Name of the secret to use for the collector |
| auth.tempo | object | `{"password":{"local":"TEMPO_PASSWORD","remote":"MANUAL_TEMPO_PASSWORD"},"user":{"local":"TEMPO_USER","remote":"MANUAL_TEMPO_USER"}}` | Tempo auth configuration |
| auth.tempo.password | object | `{"local":"TEMPO_PASSWORD","remote":"MANUAL_TEMPO_PASSWORD"}` | Password for Tempo |
| auth.tempo.password.local | string | `"TEMPO_PASSWORD"` | Local Key reference |
| auth.tempo.password.remote | string | `"MANUAL_TEMPO_PASSWORD"` | Remote Key reference |
| auth.tempo.user | object | `{"local":"TEMPO_USER","remote":"MANUAL_TEMPO_USER"}` | Username for Tempo |
| auth.tempo.user.local | string | `"TEMPO_USER"` | Local Key reference |
| auth.tempo.user.remote | string | `"MANUAL_TEMPO_USER"` | Remote Key reference |
| cluster | string | `"opal"` | Cluster the operators are deployed to |
| configMapName | string | `"otel-common-config-map"` | Name of the common config map to propagate to all collectors |
| k8sattr | object | `{"bind":["otel-collector-kubelet-sa","otel-otlp-collector","otel-otlp-logs-collector","otel-container-logs-collector","otel-collector-k8scluster-sa","otel-collector-ta-sa"],"createRole":true}` | Configuration for k8sattr extension |
| k8sattr.bind | list | `["otel-collector-kubelet-sa","otel-otlp-collector","otel-otlp-logs-collector","otel-container-logs-collector","otel-collector-k8scluster-sa","otel-collector-ta-sa"]` | Service accounts to bind the k8sattr roles to |
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
| kubelet | object | `{"createRole":true,"serviceAccount":{"create":true,"name":"otel-collector-kubelet-sa"}}` | Configuration for Kubelet Collector |
| kubelet.createRole | bool | `true` | Enable creation of kubelet role |
| kubelet.serviceAccount | object | `{"create":true,"name":"otel-collector-kubelet-sa"}` | Service account for kubelet |
| kubelet.serviceAccount.create | bool | `true` | Enable creation of the service account |
| kubelet.serviceAccount.name | string | `"otel-collector-kubelet-sa"` | Name of the service account |
| landscape | string | `"entei"` | Landscape the operator is deployed to |
| loki | string | `"https://logs-prod-011.grafana.net/loki/api/v1/push"` | Loki endpoint for logs |
| mimir | string | `"https://prometheus-prod-18-prod-ap-southeast-0.grafana.net/api/prom/push"` | Mimir endpoint for metrics |
| podSecurityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | YAML Anchor for PodSecurityContext |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | YAML Anchor for SecurityContext |
| serviceTree | object | `{"layer":"1","platform":"sulfoxide","service":"silicon"}` | AtomiCloud Service Tree. See [ServiceTree](https://atomicloud.larksuite.com/wiki/OkfJwTXGFiMJkrk6W3RuwRrZs64?theme=DARK&contentTheme=DARK#MHw5d76uDo2tBLx86cduFQMRsBb) |
| sulfoxide-bromine | object | `{"rootSecret":{"ref":"SULFOXIDE_SILICON"},"storeName":"doppler"}` | Create SecretStore via secret of secrets pattern |
| sulfoxide-bromine.rootSecret | object | `{"ref":"SULFOXIDE_SILICON"}` | Secret of Secrets reference |
| sulfoxide-bromine.rootSecret.ref | string | `"SULFOXIDE_SILICON"` | DOPPLER Token Reference |
| sulfoxide-bromine.storeName | string | `"doppler"` | Store name to create |
| ta | object | `{"createRole":true,"serviceAccount":{"create":true,"name":"otel-collector-ta-sa"}}` | Configuration for Target Allocator |
| ta.createRole | bool | `true` | Enable creation of target allocator roles |
| ta.serviceAccount | object | `{"create":true,"name":"otel-collector-ta-sa"}` | Service account for target allocation |
| ta.serviceAccount.create | bool | `true` | Enable creation of the service account |
| ta.serviceAccount.name | string | `"otel-collector-ta-sa"` | Name of the service account |
| tags | object | `{"argocd.argoproj.io/compare-options":"IgnoreExtraneous","atomi.cloud/layer":"1","atomi.cloud/platform":"sulfoxide","atomi.cloud/service":"silicon"}` | Kubernetes labels and annotations, following Service Tree |
| tempo | string | `"https://tempo-prod-07-prod-ap-southeast-0.grafana.net/tempo"` | Tempo endpoint for traces |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.1](https://github.com/norwoodj/helm-docs/releases/v1.11.1)