# cloud-builder-sonar-scanner

Sonar scanner step for google cloud builder

Forked from https://github.com/SonarSource/sonar-scanner-cli-docker adapted for cloud build

## Example

```yaml
steps:
  - name: "ooga/cloud-builder-sonar-scanner"
    env:
      - SONAR_BRANCH_NAME=your-branch-name
    secretEnv:
      - SONAR_TOKEN
    args: ["-Dsonar.projectVersion=1.0.0"]
```

Sonar project configuration can be set in file `sonar-project.properties`, via [env variables](#env-variables), or using docker args

## Env variables

[List available here](bin/entrypoint.sh)

Extracted from https://docs.sonarqube.org/latest/analysis/analysis-parameters/ with JS function

```js
JSON.stringify(
  $$("table td:first-child code")
    .map(function(el) {
      return el.innerText;
    })
    .filter(function(val) {
      return ![
        "sonar.analysis.[yourKey]",
        "sonar.cpd.${language}.minimumtokens",
        "sonar.cpd.${language}.minimumLines",
        "sonar.links.scm_dev"
      ].includes(val);
    })
);
```
