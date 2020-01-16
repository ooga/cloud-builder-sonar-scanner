# cloud-builder-sonar-scanner
Sonar scanner step for google cloud builder

## example
```yaml
steps:
  - name: 'ooga/cloud-builder-sonar-scanner'
    secretEnv:
      - SONAR_TOKEN
```

Sonar project configuration can be set in file `sonar-project.properties`
