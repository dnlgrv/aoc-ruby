guard :shell do
  watch(/([0-9]+)\/(day[0-9]+)\.rb/) do |matches|
    run_tests = "ruby #{matches[1]}/test/#{matches[2]}_test.rb"
    solve_solution = "advent solve #{matches[0]}"

    `#{run_tests} && #{solve_solution}`
  end

  watch(/_test\.rb/) do |matches|
    `ruby #{matches[0]}`
  end
end
