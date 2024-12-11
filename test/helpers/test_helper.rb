class ActiveSuppoer::TestCase
  setup do
    DatabaseCleaber.start
  end
  teardown do
    DatabaseCleaber.clean
  end
end
