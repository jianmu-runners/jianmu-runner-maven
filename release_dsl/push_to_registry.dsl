workflow:
  name: publish maven task
  ref: publish_maven_task
  description: publish maven task
  Start:
    type: start
    targets:
      - Clone
  Clone:
    type: git:v1.0
    sources:
      - Start
    targets:
      - Publish
    param:
      workspace: jianmu-runner-maven
      remote_url: https://gitee.com/jianmu_dev/jianmu-runner-maven.git
      commit_branch: master
  Publish:
    type: hub_publish:v1.0
    sources:
      - Clone
    targets:
      - End
    param:
      registry_url: https://hub.jianmu.dev
      task_dsl_file:  jianmu-runner-maven/tasks/task_mvn3_jdk11.dsl
      hub_appkey: ((jianmuhub.appkey))
  End:
    type: end
    sources:
      - Publish

