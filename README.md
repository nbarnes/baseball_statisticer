OVERVIEW
========
This is a simple baseball league statistics application, written as a
pre-interview test for Online Health by Nathaniel Barnes.

TECHNOLOGY
==========
This command-line app is programmed using Ruby.  Additional tools used
include Bundler, Rake, and MiniTest.

USAGE
======
main.rb in root directory can be invoked with two filenames.  The first should
reference a CSV file defining the players in the league and the second should
reference a CSV file defining the seasonal statistics for each player for each
year.

main.rb will, as requested in the task defintion, print to stdout A) the most
improved batting average from 2009 to 2010, for players with at least 200
at-bats, B) the slugging percentage of all players on the 2008 Oakland A's,
and C) the AL and NL triple crown winners for 2011 and 2012 (application will
output 'No winner' if there was no triple crown winner that year).

EXAMPLE: 'ruby main.rb Master-small.csv Batting-07-12.csv'

The Rakefile contains additional tasks, used for testing purposes.

AUTHOR
======
My name is Nathaniel Barnes.  I live in Seattle, WA, and enjoy cats, family,
programming, and rain.  I can be reached at nbarnes@gmail.com.

LICENSE
=======
All content in this project to which Nathaniel Barnes has rights (as
particularly distinct from those parts of this project to which Online Health
has rights) are subject to the MIT License.

The MIT License (MIT)

Copyright (c) 2014 Nathaniel Barnes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.