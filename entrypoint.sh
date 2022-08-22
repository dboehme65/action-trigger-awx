#! /usr/bin/env bash

set -e

export PYTHONUNBUFFERED=1

if [ -z "$TOWER_HOST" ]; then
  echo "Tower host is not set. Exiting."
  exit 1
fi

if [ -z "$TOWER_USERNAME" ]; then
  echo "Tower username is not set. Exiting."
  exit 1
fi

if [ -z "$TOWER_USER_PASSWORD" ]; then
  echo "Tower password is not set. Exiting."
  exit 1
fi

if [ -z "$TOWER_VERIFY_SSL" ]; then
  TOWER_VERIFY_SSL="true"
elif [ $TOWER_VERIFY_SSL = "true" ]; then
  TOWER_VERIFY_SSL="true"
elif [ $TOWER_VERIFY_SSL = "false" ]; then
  TOWER_VERIFY_SSL="false"
else
  echo "Unknown ssl verify value. Exiting."
  exit 1
fi

if [ -z "$RESOURCE_TYPE" ]; then
  echo "Resource type is not set. Exiting."
  exit 1
fi

if [ -z "$RESOURCE_ID" ]; then
  echo "Resource name or id is not set. Exiting."
  exit 1
else
  RESOURCE_ID="'$RESOURCE_ID'"
fi

if [ -z "$LIMIT" ]; then
  LIMIT_VALUE=""
else
  LIMIT_VALUE="--limit '$LIMIT'"
fi

if [ -z "$TAGS" ]; then
  TAGS_VALUE=""
else
  TAGS_VALUE="--job_tags '$TAGS'"
fi

if [ -z "$SKIP_TAGS" ]; then
  SKIP_TAGS_VALUE=""
else
  SKIP_TAGS_VALUE="--skip_tags '$SKIP_TAGS'"
fi

if [ -z "$TIMEOUT" ]; then
  TIMEOUT_VALUE="--timeout 3600"
else
  TIMEOUT_VALUE="--timeout $TIMEOUT"
fi

if [ -z "$INVENTORY" ]; then
  INVENTORY_VALUE=""
else
  INVENTORY_VALUE="--inventory '$INVENTORY'"
fi

if [ -z "$BRANCH" ]; then
  BRANCH_VALUE=""
else
  BRANCH_VALUE="--scm_branch '$BRANCH'"
fi

if [ -z "$MONITOR" ]; then
  MONITOR="true"
fi

if [ $MONITOR = "true" ]; then
  MONITOR_VALUE="--monitor"
elif [ $MONITOR = "false" ]; then
  MONITOR_VALUE=""
else
  echo "Unknown monitor value. Exiting."
  exit 1
fi

if [ -z "$EXTRA_VARS" ]; then
  EXTRA_VARS_VALUE=""
else
  EXTRA_VARS_VALUE="--extra_vars '$EXTRA_VARS'"
fi

if [ -z "$JOB_TYPE" ]; then
  JOB_TYPE_VALUE=""
elif [ $JOB_TYPE = "run" ]; then
  JOB_TYPE_VALUE="--job_type 'run'"
elif [ $JOB_TYPE = "check" ]; then
  JOB_TYPE_VALUE="--job_type 'check'"
else
  echo "Unknown job type type. Exiting."
  exit 1
fi

if [ $RESOURCE_TYPE = "job_template" ]; then
  ACTION="job_templates launch"
elif [ $RESOURCE_TYPE = "workflow_job_template" ]; then
  ACTION="workflow_job_templates launch"
elif [ $RESOURCE_TYPE = "project" ]; then
  ACTION="projects update"
else
  echo "Unknown resource type. Exiting."
  exit 1
fi

echo "awx ${ACTION} ${RESOURCE_NAME} -f human ${MONITOR_VALUE} ${TIMEOUT_VALUE} ${LIMIT_VALUE} ${INVENTORY_VALUE} ${EXTRA_VARS_VALUE} ${BRANCH_VALUE} ${JOB_TYPE_VALUE} ${TAGS_VALUE} ${SKIP_TAGS_VALUE}"
echo "awx ${ACTION} ${RESOURCE_NAME} -f human ${MONITOR_VALUE} ${TIMEOUT_VALUE} ${LIMIT_VALUE} ${INVENTORY_VALUE} ${EXTRA_VARS_VALUE} ${BRANCH_VALUE} ${JOB_TYPE_VALUE} ${TAGS_VALUE} ${SKIP_TAGS_VALUE}" | bash
