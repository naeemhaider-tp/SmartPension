# frozen_string_literal: true

# Error handling  for different cases.
module ErrorHandler
  # Error Handling for Fileempty case.
  class FileEmptyError < ArgumentError
    def message
      'File is Empty Please try again.'
    end
  end

  # Error handling  for Filenotfound  case.
  class FileNotFoundError < ArgumentError
    def message
      'File does not exist Please check file again.'
    end
  end
end
