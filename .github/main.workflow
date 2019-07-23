workflow "Docker build" {
  on = "pull_request"
  resolves = ["Docker Build"]
}

action "filter-to-pr-open-synced" {
  uses = "actions/bin/filter@master"
  args = "action 'opened|synchronize'" 
}

action "Docker Build" {
  needs = ["filter-to-pr-open-synced"]
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "build -t uw-it-edm/atlantis ."
}
