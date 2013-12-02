CreditCard Validator
====================
A pretty simple OO ruby lib used to check if a credit card number is valid or not.

```
+============+=============+===============+
| Card Type  | Begins With | Number Length |
+============+=============+===============+
| AMEX       | 34 or 37    | 15            |
+------------+-------------+---------------+
| Discover   | 6011        | 16            |
+------------+-------------+---------------+
| MasterCard | 51-55       | 16            |
+------------+-------------+---------------+
| Visa       | 4           | 13 or 16      |
+------------+-------------+---------------+
```

Is it good?
====================
[Yes](https://news.ycombinator.com/item?id=3067434)

Usage
====================
Just run `ruby cc_validator.rb` like this example:

```
m3nTe :: Documents/RubyJobsTest/CC_VALIDATOR » ruby cc_validator.rb
Credit Card Validator using Luhn Algorithm
by Antonio Parisi <ant.parisi@gmail.com> - 2013
Skype: code87_m3nTe
How to use it:
Insert any CCs, one per row. Eg: 4408041234567893
Type 'x' or 'exit' for finish the process
[*] > 4408041234567893
[+] visa: 4408041234567893 (valid)
[*] > 4563 9601 9
[+] unknown: 456396019 (invalid)
[*] > exit
m3nTe :: Documents/RubyJobsTest/CC_VALIDATOR »
```

LICENSE
====================
(MIT License)

Copyright (c) 2013 Fractal contact@wearefractal.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
