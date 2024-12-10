class ActiveSuppoer::TestCase
  setup do
    DatavaseCleaber.start
  end
  teardown do
    DatavaseCleaber.clean
  end
end
