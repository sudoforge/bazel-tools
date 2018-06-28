load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def buildozer_dependencies():
    _maybe(
        http_archive,
        name = "bazel_skylib",
        strip_prefix = "bazel-skylib-0.4.0",
        sha256 = "57e8737fbfa2eaee76b86dd8c1184251720c840cd9abe5c3f1566d331cdf7d65",
        urls = ["https://github.com/bazelbuild/bazel-skylib/archive/0.4.0.tar.gz"],
    )

    # used for build.proto for buildozer :tableflip: https://github.com/bazelbuild/buildtools/issues/143
    _maybe(
        http_archive,
        name = "io_bazel",
        sha256 = "66135f877d0cc075b683474c50b1f7c3e2749bf0a40e446f20392f44494fefff",
        strip_prefix = "bazel-0.12.0",
        urls = [
            "http://mirror.bazel.build/github.com/bazelbuild/bazel/archive/0.12.0.tar.gz",
            "https://github.com/bazelbuild/bazel/archive/0.12.0.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        sha256 = "4f4a100ffcb4d2df9ba385738c7d46821b5e3564cf39325829f5ff0dd6ca95fe",
        strip_prefix = "buildtools-4306203da5b965a51bc6e46de4a50c0286eb2971",
        urls = ["https://github.com/bazelbuild/buildtools/archive/4306203da5b965a51bc6e46de4a50c0286eb2971.zip"],
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)