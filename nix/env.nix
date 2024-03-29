{ pkgs, packages }:
with packages;
{
  system = [
    coreutils
    sd
    bash
    jq
    yq-go
  ];

  dev = [
    pls
    skopeo
    git
  ];

  infra = [
    k3d
    helm
    kubectl
  ];

  main = [
  ];

  lint = [
    # core
    treefmt

    helm-docs

    gitlint
    shellcheck
  ];

  releaser = [
    sg
  ];
}
