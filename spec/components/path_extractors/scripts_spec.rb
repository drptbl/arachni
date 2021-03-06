require 'spec_helper'

describe name_from_filename do
    include_examples 'path_extractor'

    def results
        [
            'http://test.com',
            'test',
            'test.com',
            'test/stuff2.php'
        ]
    end

    def text
        s = <<SCRIPT
        <script>
            var path = "test/stuff2.php"
        </script>
SCRIPT

        s + [
            'http://test.com',
            'test',
            'test.com'
        ].map { |u| "<script src='#{u}'>Stuff</script>" }.join
    end

    easy_test
end
