mock "tfplan/v2" {
  module {
    source = "<relative_path_to_passing_mock>"
  }
}

test {
    rules = {
        main = true
    }
}

