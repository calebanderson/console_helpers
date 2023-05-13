require_relative '../minitest_helper'
require_relative 'test_display_string'

module ResponsiveConsole
  class TestShortArray < Minitest::Test
    include TestDisplayString

    def setup
      self.array_format = :test_short
      super
    end

    def test_nested_arrays
      assert_equal(subject_output(nested_array), <<~TEXT.strip)
        [ [ "A~~~~~~~~~~~~~~~~~~~~~~~~~~~", "B~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
            "C~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "D~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ],
          [ "E~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "F~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
            "G~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "H~~~~~~~~~~~~~~~~~~~~~~~~~~~" ],
          [ "I~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "J~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
            "K~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "L~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ] ]
      TEXT
    end

    def test_hashes_with_array_values
      assert_equal(subject_output(array_values), <<~TEXT.strip)
        { A~~~~~~~~~~~~~~~~~~~~~~~~~~~: [ "B~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
                                          "C~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
                                          "D~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ],
          E~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~: [ "F~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
                                              "G~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
                                              "H~~~~~~~~~~~~~~~~~~~~~~~~~~~" ],
          I~~~~~~~~~~~~~~~~~~~~~~~~~~~~: [ "J~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
                                           "K~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
                                           "L~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ] }
      TEXT
    end

    def test_hashes_with_array_keys
      assert_equal(subject_output(array_keys), <<~TEXT.strip)
        { [ "B~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "C~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
            "D~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ]: "A~~~~~~~~~~~~~~~~~~~~~~~~~~~",
          [ "F~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "G~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
            "H~~~~~~~~~~~~~~~~~~~~~~~~~~~" ]: "E~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
          [ "J~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", "K~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",
            "L~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ]: "I~~~~~~~~~~~~~~~~~~~~~~~~~~~~" }
      TEXT
    end
  end
end
