#!/bin/bash

set -euo pipefail

declare -a args

add_env_var_as_env_prop() {
  if [ "$1" ]; then
    args+=("-D$2=$1")
  fi
}

add_env_var_as_env_prop "${SONAR_USER_HOME:-}" "sonar.userHome"
add_env_var_as_env_prop "${SONAR_BRANCH_NAME:-}" "sonar.branch.name"

add_env_var_as_env_prop "${SONAR_HOST_URL:-}" "sonar.host.url"
add_env_var_as_env_prop "${SONAR_PROJECT_KEY:-}" "sonar.projectKey"
add_env_var_as_env_prop "${SONAR_PROJECT_NAME:-}" "sonar.projectName"
add_env_var_as_env_prop "${SONAR_PROJECT_VERSION:-}" "sonar.projectVersion"
add_env_var_as_env_prop "${SONAR_LOGIN:-}" "sonar.login"
add_env_var_as_env_prop "${SONAR_PASSWORD:-}" "sonar.password"
add_env_var_as_env_prop "${SONAR_WS_TIMEOUT:-}" "sonar.ws.timeout"
add_env_var_as_env_prop "${SONAR_PROJECT_DESCRIPTION:-}" "sonar.projectDescription"
add_env_var_as_env_prop "${SONAR_LINKS_HOMEPAGE:-}" "sonar.links.homepage"
add_env_var_as_env_prop "${SONAR_LINKS_CI:-}" "sonar.links.ci"
add_env_var_as_env_prop "${SONAR_LINKS_ISSUE:-}" "sonar.links.issue"
add_env_var_as_env_prop "${SONAR_LINKS_SCM:-}" "sonar.links.scm"
add_env_var_as_env_prop "${SONAR_SOURCES:-}" "sonar.sources"
add_env_var_as_env_prop "${SONAR_TESTS:-}" "sonar.tests"
add_env_var_as_env_prop "${SONAR_SOURCE_ENCODING:-}" "sonar.sourceEncoding"
add_env_var_as_env_prop "${SONAR_EXTERNAL_ISSUES_REPORT_PATHS:-}" "sonar.externalIssuesReportPaths"
add_env_var_as_env_prop "${SONAR_PROJECT_DATE:-}" "sonar.projectDate"
add_env_var_as_env_prop "${SONAR_PROJECT_BASE_DIR:-}" "sonar.projectBaseDir"
add_env_var_as_env_prop "${SONAR_WORKING_DIRECTORY:-}" "sonar.working.directory"
add_env_var_as_env_prop "${SONAR_SCM_PROVIDER:-}" "sonar.scm.provider"
add_env_var_as_env_prop "${SONAR_SCM_FORCE_RELOAD_ALL:-}" "sonar.scm.forceReloadAll"
add_env_var_as_env_prop "${SONAR_SCM_EXCLUSIONS_DISABLED:-}" "sonar.scm.exclusions.disabled"
add_env_var_as_env_prop "${SONAR_SCM_REVISION:-}" "sonar.scm.revision"
add_env_var_as_env_prop "${SONAR_BUILD_STRING:-}" "sonar.buildString"
add_env_var_as_env_prop "${SONAR_LOG_LEVEL:-}" "sonar.log.level"
add_env_var_as_env_prop "${SONAR_VERBOSE:-}" "sonar.verbose"
add_env_var_as_env_prop "${SONAR_SHOW_PROFILING:-}" "sonar.showProfiling"
add_env_var_as_env_prop "${SONAR_SCANNER_DUMP_TO_FILE:-}" "sonar.scanner.dumpToFile"
add_env_var_as_env_prop "${SONAR_SCANNER_METADATA_FILE_PATH:-}" "sonar.scanner.metadataFilePath"

PROJECT_BASE_DIR="$PWD"
if [ "${SONAR_PROJECT_BASE_DIR:-}" ]; then
  PROJECT_BASE_DIR="${SONAR_PROJECT_BASE_DIR}"
fi

export SONAR_USER_HOME="$PROJECT_BASE_DIR/.sonar"

sonar-scanner "${args[@]}" "$@"
