# AWX resource triggering

This action aims to interact with AWX.

It connects to an AWX and launches a job or workflow_job template or updates project.

## Usage

See [action.yml](action.yml)

### Exaples

```yaml
  awx-examples:
    runs-on: ubuntu-latest
    steps:
      - name: "Test AWX: Simple job template"
        uses: freenet-actions/action-trigger-awx@v1
        with:
          tower_url: ${{ secrets.TOWER_HOST }}
          tower_username: ${{ secrets.TOWER_USER }}
          tower_password: ${{ secrets.TOWER_PASSWORD }}
          resource_type: job_template
          resource_name: "744"

      - name: "Test AWX: Simple workflow template"
        uses: freenet-actions/action-trigger-awx@v1
        with:
          tower_url: ${{ secrets.TOWER_HOST }}
          tower_username: ${{ secrets.TOWER_USER }}
          tower_password: ${{ secrets.TOWER_PASSWORD }}
          resource_type: workflow_job_template
          resource_name: "548"

      - name: "Test AWX: Simple workflow template with extra_vars"
        uses: freenet-actions/action-trigger-awx@v1
        with:
          tower_url: ${{ secrets.TOWER_HOST }}
          tower_username: ${{ secrets.TOWER_USER }}
          tower_password: ${{ secrets.TOWER_PASSWORD }}
          resource_type: "workflow_job_template"
          resource_name: "552"
          extra_vars: '{"server": "metaluna-auto-d11.mobilcom.de", "launched_by": "My Name"}'          

      - name: "Test AWX: Simple ob template without waiting"
        uses: freenet-actions/action-trigger-awx@v1
        with:
          tower_url: ${{ secrets.TOWER_HOST }}
          tower_username: ${{ secrets.TOWER_USER }}
          tower_password: ${{ secrets.TOWER_PASSWORD }}
          resource_type: job_template
          resource_name: actions-awxkit-test2
          monitor: "false"
```

## License
The scripts and documentation in this project are released under the [MIT License](License)
