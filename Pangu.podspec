Pod::Spec.new do |s|

  s.name        = "Pangu"
  s.version     = "0.2"
  s.summary     = "Paranoid text spacing in Swift"
  s.description = "Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean) and half-width characters (alphabetical letters, numerical digits and symbols)."
  s.homepage    = "https://github.com/X140Yu/pangu.Swift"
  s.license     = { :type => "MIT", :file => "LICENSE" }
  s.author      = { "X140Yu" => "zhaoxinyu1994@gmail.com" }

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/X140Yu/pangu.Swift.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/*.swift"

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/panguTests/*.swift'
  end

end
