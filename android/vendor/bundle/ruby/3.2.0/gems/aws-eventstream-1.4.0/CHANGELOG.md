Unreleased Changes
------------------

1.4.0 (2025-06-02)
------------------

* Feature - AWS SDK for Ruby no longer supports Ruby runtime versions 2.5 and 2.6.

1.3.2 (2025-03-06)
------------------

* Issue - Add back event stream max payload size and headers length checks with a 24MB limit.

1.3.1 (2025-02-13)
------------------

* Issue - Remove event stream max payload size and headers length checks.

1.3.0 (2023-11-22)
------------------

* Feature - AWS SDK for Ruby no longer supports Ruby runtime versions 2.3 and 2.4.

1.2.0 (2021-09-01)
------------------

* Feature - AWS SDK for Ruby no longer supports Ruby runtime versions 1.9, 2.0, 2.1, and 2.2.

1.1.1 (2021-03-04)
------------------

* Issue - Include LICENSE, CHANGELOG, and VERSION files with this gem.

1.1.0 (2020-04-08)
------------------

* Feature - Remove internal ByteBuffer and replace with String to remove dup and string mutation.

1.0.3 (2019-04-24)
------------------

* Issue - Use single quotes for string where interpolation is not done.

1.0.2 (2019-03-11)
------------------

* Issue - public #encode_headers method

1.0.1 (2018-06-15)
------------------

* Issue - #decode_chunk buffers insufficient prelude message

1.0.0 (2018-05-10)
------------------

* Feature - Initial release of `aws-eventstream` gem.
