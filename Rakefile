=begin
Copyright (c) 2011 Litle & Co.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
=end
require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'
require 'rake/clean'

spec = Gem::Specification.new do |s|
  FileUtils.rm_rf('pkg')
  s.name = "LitleOnline"
  s.summary = "Ruby SDK produced by Litle & Co. for transaction processing using Litle XML format v8.29"
  s.description = File.read(File.join(File.dirname(__FILE__), 'DESCRIPTION'))
  s.requirements =
  [ 'Contact sdksupport@litle.com for more information' ]
  s.version = "9.3.1"
  s.author = "Litle & Co"
  s.email = "sdksupport@litle.com"
  s.homepage = "http://www.litle.com/developers"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.8.7'
  s.files = Dir['**/**']
  s.executables = [ 'sample_driver.rb', 'Setup.rb' ]
  s.test_files = Dir["test/unit/ts_unit.rb"]
  s.has_rdoc = true
  s.add_dependency('xml-object')
  s.add_dependency('xml-mapping')
  s.add_dependency('net-sftp')
  s.add_dependency('libxml-ruby')
  s.add_dependency('crack')
  s.add_development_dependency('mocha')
end

Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
  pkg.need_zip = true
  pkg.need_tar = true
end

namespace :test do

  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'unit'
    t.test_files = FileList['test/unit/ts_unit.rb']
    t.verbose = true
  end

  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'functional'
    t.test_files = FileList['test/functional/ts_all.rb']
    t.verbose = true
  end

  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'certification'
    t.test_files = FileList['test/certification/certTest*.rb']
    t.verbose = true
  end
  
  Rake::TestTask.new do |t|
    t.libs << '.'
    t.name = 'all'
    t.test_files = FileList['test/**/*.rb']
    t.verbose = true
  end
  
end

task :default =>'gem'
