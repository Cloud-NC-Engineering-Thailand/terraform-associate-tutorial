mock "tfplan/v2" {
  module {
    source = "<relative_path_to_failing_mock>"
  }
}

test {
    rules = {
        main = false
    }
}

